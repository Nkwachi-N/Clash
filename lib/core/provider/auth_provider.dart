import 'package:clash_flutter/core/models/http_response.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:flutter/cupertino.dart' show ChangeNotifier;
import 'package:hive/hive.dart';

import '../constants.dart';
import '../models/user.dart';
import '../repository/auth_repository.dart';

enum UserNameState{
  idle,
  loading,
  exists,
  notFound,
}

class AuthProvider extends ChangeNotifier {
  final _repository = AuthRepository();

  bool storingUserName = false;
  bool storingAvatar = false;
  bool authorizing = false;
  int? selectedAvatar;

  UserNameState userNameProgress = UserNameState.idle;

  late User user;

  initUser(){
    final box = Hive.box(Constants.kHiveBox);
     final savedUser = box.get('user',defaultValue: null);

     if(savedUser != null) {
       user = savedUser;
       _repository.updateFcmToken();
     }

  }


  Future<HttpResponse<String>> authorize() async {
    authorizing = true;
    notifyListeners();
    late HttpResponse<String> httpResponse;
    try {
      bool response = await _repository.authorize();
      if (response) {
        final userExists = await _repository.checkUserExists();
        if (userExists) {
          httpResponse = HttpResponse(responseStatus: ResponseStatus.success,
              data: RouteGenerator.homeScreen);
        } else {
          httpResponse = HttpResponse(responseStatus: ResponseStatus.success,
              data: RouteGenerator.userNameScreen);
        }
      }
    } catch (_){
      httpResponse = HttpResponse(responseStatus: ResponseStatus.failed,
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

    bool status = await _repository.storeUserName(userName);

    storingUserName = false;
    notifyListeners();

    return status;
  }

  void changeAvatar(int index) {
    selectedAvatar = index;
    notifyListeners();
  }

  Future<bool> storeAvatar() async {
    storingAvatar = true;
    notifyListeners();

    bool status = await _repository.saveAvatar(selectedAvatar!);

    storingAvatar = false;
    notifyListeners();

    return status;
  }




  Future<void> userNameCheck(String userName) async {
    userNameProgress = UserNameState.loading;
    notifyListeners();

    bool result =  await _repository.usernameCheck(userName);

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




}
