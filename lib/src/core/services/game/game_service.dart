import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/models/category/category.dart';
import 'package:clash_flutter/src/core/models/game.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:spotify_flutter/spotify_flutter.dart';

import '../../models/user.dart';

class GameService {
  final _fireBaseService = locator<FireBaseService>();
  final _spotifyRepository = locator<SpotifyService>();
  final _notificationService = locator<NotificationService>();
  final _userDatabaseService = locator<UserDatabaseService>();

  User? get user => _userDatabaseService.getCurrentUser();

  List<String> genreList = [];
  late Category category;
  late Artist artist;
  int? rounds;

  Game? get game => _game;
  Game? _game;

  void selectCategory(Category category) {
    this.category = category;
  }

  void selectRounds(int rounds) {
    this.rounds = rounds;
  }

  void selectArtist(Artist artist) {
    this.artist = artist;
  }

  void createGame(User guest) {
    if (user?.id != null) {
      _game = Game(
        id: user!.id,
        host: user,
        category: category,
        rounds: rounds,
        guest: guest,
      );
      _fireBaseService.saveGame(_game!);
    }
  }

  void cancelNotifcation() {
    //call cancel notifcation in case user hasn't received it.
    //
  }
}
