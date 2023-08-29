import 'package:clash_flutter/src/core/app/app.locator.dart';
import 'package:clash_flutter/src/core/models/turn.dart';
import 'package:clash_flutter/src/core/models/user.dart';
import 'package:clash_flutter/src/core/services/firebase/firebase_service.dart';
import 'package:clash_flutter/src/core/services/game/game.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/models/game.dart';
import '../../../../../core/services/database/database.dart';

class ClashRoomViewModel extends BaseViewModel {
  Game? game;
  final _firebaseService = locator<FireBaseService>();
  final _gameService = locator<GameService>();

   User? get user => locator<UserDatabaseService>().getCurrentUser();
   bool get  isHost => user?.id == game?.host?.id;
   Turn get  myRole => isHost ? Turn.host : Turn.guest;

   String? get hostName => game?.host?.name;
   String? get guestName => game?.guest?.name;

   Turn? get currentTurn => game?.turn;


  ClashRoomViewModel();


  onReady() async {
    game = await _firebaseService.getGameById('mw6idet06rwlia05619iwpkmk');
    game?.turn ??= Turn.host;
    _firebaseService.getGameByStreamId(game!.id).listen((result) {
      if (result.docs.isNotEmpty) {
        final gameSnapShot = result.docs[0];
        if (gameSnapShot.exists) {
          game =
              Game.fromFirestore(gameSnapShot.data() as Map<String, dynamic>);
          notifyListeners();
        }
      }
    });
  }


  addTrack() {
    if(game == null) return;
    if(currentTurn == Turn.host) {
      final updatedGame = game!.copyWith(
        hostPlayed: _gameService.addedTracks.first,
        turn: isHost ? Turn.guest : Turn.host,
      );
      _firebaseService.saveGame(updatedGame);
    } else {
      final updatedGame = game!.copyWith(
        guestPlayed: _gameService.addedTracks.toList()[0],
        turn: isHost ? Turn.guest : Turn.host,
      );

      _firebaseService.saveGame(updatedGame);
    }
  }
}
