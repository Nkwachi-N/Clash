import 'package:clash_flutter/core/models/game.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GameRepository{

  CollectionReference games = FirebaseFirestore.instance.collection('games');





  Future<void> createGame(Game game,String userId) async {

  }



}