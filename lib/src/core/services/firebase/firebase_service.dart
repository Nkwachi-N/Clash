import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user.dart';

class FireBaseService{

  CollectionReference users = FirebaseFirestore.instance.collection('users');


  void saveUser(User user) {
    try{
      users.doc(user.id).set(user.toMap());
    }catch(e) {
      //TODO: Handle exception.
    }
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