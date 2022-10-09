import 'package:clash_flutter/src/core/models/game.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/user.dart';

class FireBaseService{

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference games = FirebaseFirestore.instance.collection('games');


  void saveUser(User user) {
    try{
      users.doc(user.id).set(user.toFirebaseMap());
    }catch(e) {
      //TODO: Handle exception.
    }
  }

  void saveGame(Game game) {
    try{
      users.doc(game.id).set(game.toFirestore());
    }catch(e) {
      //TODO: Handle exception.
    }
  }


  Future<User?> getUserByUserName(String username) async {
    final result = await _searchByUserName(username);

    if (result.docs.isNotEmpty) {
      final userSnapShot = result.docs[0];
      if (userSnapShot.exists) {
        final user = User.fromFirebaseData(userSnapShot.data() as Map<String, dynamic>);
        return user;
      }
    }

    return null;
  }

  Future<Game?> getGameById(String gameId) async {
    final result = await FirebaseFirestore.instance
        .collection('games')
        .where('id', isEqualTo: gameId)
        .get();

    if (result.docs.isNotEmpty) {
      final gameSnapShot = result.docs[0];
      if (gameSnapShot.exists) {
        final game = Game.fromFirestore(gameSnapShot.data() as Map<String, dynamic>);
        return game;
      }
    }

    return null;
  }

  Future<QuerySnapshot> _searchByUserName(String username) async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: username.toLowerCase())
        .get();

    return result;
  }




}