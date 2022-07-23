import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class GameRepository{

  CollectionReference games = FirebaseFirestore.instance.collection('games');

  Future<void> createGame(Game game,String userId) async {

  }

}