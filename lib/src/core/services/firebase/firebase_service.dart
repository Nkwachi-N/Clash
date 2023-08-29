import 'package:clash_flutter/src/core/models/game.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/user.dart';

class FireBaseService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference games = FirebaseFirestore.instance.collection('games');

  void saveUser(User user) {
    try {
      users.doc(user.id).set(user.toFirebaseMap());
    } catch (e) {
      //TODO: Handle exception.
    }
  }

  void saveGame(Game game) {
    try {
      games.doc(game.id).set(game.toFirestore());
    } catch (e) {
      //TODO: Handle exception.
    }
  }

  Future<User?> getUserByUserName(String username) async {
    final result = await _searchByUserName(username);

    if (result.docs.isNotEmpty) {
      final userSnapShot = result.docs[0];
      if (userSnapShot.exists) {
        final user =
            User.fromFirebaseData(userSnapShot.data() as Map<String, dynamic>);
        return user;
      }
    }

    return null;
  }

  Future<User?> getUserByUserId(String userId) async {
    final result = await _searchUserByUserId(userId);

    if (result.docs.isNotEmpty) {
      final userSnapShot = result.docs[0];
      if (userSnapShot.exists) {
        final user =
            User.fromFirebaseData(userSnapShot.data() as Map<String, dynamic>);
        return user;
      }
    }

    return null;
  }

  Future<Game?> getGameById(String gameId) async {
    final result = await games.where('id', isEqualTo: gameId).get();

    Game? gottenGame;

    print(result.docs.length);

    if (result.docs.isNotEmpty) {
      final gameSnapShot = result.docs[0];
      if (gameSnapShot.exists) {
        print('game snapshot exists');
        gottenGame =
            Game.fromFirestore(gameSnapShot.data() as Map<String, dynamic>);
      }
    }

    return gottenGame;
  }

  Stream<QuerySnapshot> getGameByStreamId(String gameId) =>
      games.where('id', isEqualTo: gameId).snapshots();

  Future<QuerySnapshot> _searchByUserName(String username) async {
    final result =
        await users.where('name', isEqualTo: username.toLowerCase()).get();

    return result;
  }

  Future<QuerySnapshot> _searchUserByUserId(String userId) async {
    final result =
        await users.where('id', isEqualTo: userId.toLowerCase()).get();

    return result;
  }
}
