import 'package:clash_flutter/core/api_route.dart';
import 'package:clash_flutter/core/constants.dart';
import 'package:clash_flutter/core/dio_util.dart';
import 'package:clash_flutter/core/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

class UserRepository{

  final _dioUtil = DioUtil();

  CollectionReference users = FirebaseFirestore.instance.collection('users');


  Future<bool> storeUserName(String userName) async {
    bool status = false;
    try {
      String? userId = await _getUserId();

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
      final box = Hive.box(Constants.kHiveBox);
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

  Future<bool> saveAvatar(int avatar) async {
    bool status = false;
    try {
      final box = Hive.box(Constants.kHiveBox);
      final User user = box.get('user');
      user.avatar = avatar.toString();
      status = await _saveUser(user);
    } catch (e) {
      return status;
    }
    return status;
  }

  Future<String?> _getUserId() async {
    final response = await _dioUtil.get(
      ApiRoute.getUserInfo,
    );

    return response.data!['id'];
  }

  Future<User?> checkUserExists() async {
    final userId = await _getUserId();
    final userSnapShot =  await users.doc(userId).get();
    if(userSnapShot.exists) {
      final user = User.fromJson(userSnapShot.data()  as Map<String, dynamic>);
      await _saveUser(user);
      return user;
    }
    return null;
  }

  Future<User?> getUserByUserName(String username) async{

    final result = await _searchByUserName(username);

    if(result.docs.isNotEmpty) {
      final userSnapShot = result.docs[0];
      if(userSnapShot.exists) {
        final user = User.fromJson(userSnapShot.data()  as Map<String, dynamic>);
        return user;
      }
    }

    return null;

  }

  Future<QuerySnapshot> _searchByUserName(String username) async {
  final result = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: username).get();

  return result;


  }
}