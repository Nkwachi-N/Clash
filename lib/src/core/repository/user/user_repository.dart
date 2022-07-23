import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/constants/constants.dart';
import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../models/user.dart';
import '../../util/notification_util.dart';

@lazySingleton
class UserRepository {
  final _spotifyRepository = locator<SpotifyRepository>();

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

  Future<bool> storeUserName(String userName) async {
    bool status = false;
    try {
      String? userId = await _spotifyRepository.getUserId();
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
  }

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

  Future<bool> usernameCheck(String username) async {
    final result = await _searchByUserName(username);
    return result.docs.isEmpty;
  }

  Future<bool> saveAvatar(String avatar) async {
    bool status = false;
    try {
      final box = Hive.box(PrefConstants.kHiveBox);
      final User user = box.get('user');
      user.avatar = avatar;
      status = await _saveUser(user);
    } catch (e) {
      return status;
    }
    return status;
  }

  Future<User?> checkUserExists() async {
    final userId = await _spotifyRepository.getUserId();

    if (userId == null || userId.isEmpty) {
      return null;
    }
    final userSnapShot = await users.doc(userId).get();
    if (userSnapShot.exists) {
      final user = User.fromJson(userSnapShot.data() as Map<String, dynamic>);
      await _saveUser(user);
      return user;
    }
    return null;
  }

  Future<User?> getUserByUserName(String username) async {
    final result = await _searchByUserName(username);

    if (result.docs.isNotEmpty) {
      final userSnapShot = result.docs[0];
      if (userSnapShot.exists) {
        final user = User.fromJson(userSnapShot.data() as Map<String, dynamic>);
        return user;
      }
    }

    return null;
  }

  Future<QuerySnapshot> _searchByUserName(String username) async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: username)
        .get();

    return result;
  }
}
