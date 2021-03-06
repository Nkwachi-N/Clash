import 'package:clash_flutter/core/models/http_response.dart';
import 'package:clash_flutter/core/util/notification_util.dart';
import 'package:clash_flutter/core/repository/user_repository.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:clash_flutter/spotify/spotify_repository.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../constants.dart';
import '../models/user.dart';

enum UserNameState{
  idle,
  loading,
  exists,
  notFound,
}

class UserProvider extends ChangeNotifier {
  SpotifyRepository? _spotifyRepository;
  UserRepository? _userRepository;

  bool storingUserName = false;
  bool storingAvatar = false;
  bool authorizing = false;
  String? selectedAvatar;

  UserNameState userNameProgress = UserNameState.idle;

  late User user;

  initUser(){
    final box = Hive.box(Constants.kHiveBox);
     final savedUser = box.get('user',defaultValue: null);

     if(savedUser != null) {
       user = savedUser;
       NotificationUtil.setUserId(user.id);
     }



  }


  Future<HttpResponse<String>> authorize() async {
    authorizing = true;
    notifyListeners();
    late HttpResponse<String> httpResponse;
    try {
      bool response = await _spotifyRepository?.authorize() ?? false;
      if (response) {
        final existingUser = await _userRepository?.checkUserExists();
        if (existingUser != null) {
          user = existingUser;
          httpResponse = HttpResponse(status: Status.success,
              data: RouteGenerator.homeScreen);
        } else {
          httpResponse = HttpResponse(status: Status.success,
              data: RouteGenerator.userNameScreen);
        }
      }else{
        httpResponse = HttpResponse(status: Status.failed,
            data: 'Sorry, something went wrong');
      }
    } catch (_){
      httpResponse = HttpResponse(status: Status.failed,
          data: 'Sorry, something went wrong');
    } finally {
      authorizing = false;
      notifyListeners();
    }

    return httpResponse;
  }

  Future<bool> storeUserName(String userName) async {
    storingUserName = true;
    notifyListeners();

    bool status = await _userRepository?.storeUserName(userName) ?? false;

    storingUserName = false;
    notifyListeners();

    return status;
  }

  void changeAvatar(String index) {
    selectedAvatar = index;
    notifyListeners();
  }

  Future<bool> storeAvatar() async {
    storingAvatar = true;
    notifyListeners();

    bool status = await _userRepository?.saveAvatar(selectedAvatar!) ?? false;

    storingAvatar = false;
    notifyListeners();

    return status;
  }




  Future<void> userNameCheck(String userName) async {
    userNameProgress = UserNameState.loading;
    notifyListeners();

    bool result =  await _userRepository?.usernameCheck(userName) ?? false;

    if(result) {
      //user name exists.

      userNameProgress = UserNameState.notFound;

    }else {
      //user name does not exist.

      userNameProgress = UserNameState.exists;
    }

    notifyListeners();


  }

  void resetUserNameState() {
    userNameProgress = UserNameState.idle;
    notifyListeners();
  }

  void initialise(SpotifyRepository spotify, UserRepository user) {
    _userRepository = user;
    _spotifyRepository = spotify;
  }




}
