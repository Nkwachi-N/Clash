import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/models/category/category.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:spotify_flutter/spotify_flutter.dart';




class GameService{
  final _fireBaseService = locator<FireBaseService>();
  final _spotifyRepository = locator<SpotifyService>();
  final _notificationService = locator<NotificationService>();

  List<String> genreList = [];
  late Category category;
  late Artist artist;
  int? rounds;

  String gameId = '';

  void selectCategory(Category category) {
    this.category = category;
  }

  void selectRounds(int rounds) {
    this.rounds = rounds;
  }


  void selectArtist(Artist artist) {
    this.artist = artist;
  }



  Future<void> _getGenre() async {
    genreList = await _spotifyRepository.getGenre();
  }




  void setUpGame() {

  }



  void cancelNotifcation() {
    //call cancel notifcation in case user hasn't received it.
    //
  }

  void selectGenre(String genre) {

  }




}