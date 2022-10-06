import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/constants/constants.dart';
import 'package:clash_flutter/src/core/services/spotify/spotify_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:spotify_flutter/spotify_flutter.dart';

import '../../models/user.dart';
import '../../util/notification_util.dart';

class UserService {
  final _spotifyRepository = locator<SpotifyService>();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  late User user;

  initUser() {
    final box = Hive.box(PrefConstants.kHiveBox);
    final savedUser = box.get('user', defaultValue: null);

    if (savedUser != null) {
      user = savedUser;
      NotificationUtil.setUserId(user.id);
    }
  }

  /*Future<bool> storeUserName(String userName) async {
    bool status = false;
    try {
      GetCurrentUserProfileResponse? user = await _spotifyRepository.getUser();
      final userId = user?.id;
      if (userId != null) {
        status = await _saveUser(User(
          id: userId,
          name: userName,
        ));
      }
    } catch (e) {
      return status;
    }
    return status;
  }*/

  Future<bool> _saveUser(User user) async {
    bool status = false;

    try {
      await users.doc(user.id).set(user.toMap());
      final box = Hive.box(PrefConstants.kHiveBox);
      box.put('user', user);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }




}
