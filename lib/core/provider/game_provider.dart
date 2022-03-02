import 'package:clash_flutter/core/models/artists.dart';
import 'package:clash_flutter/core/repository/game_repository.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import '../models/game.dart';

class GameProvider extends ChangeNotifier{

  final _gameRepository = GameRepository();
  List<String> genreList = [];
  bool gettingSubCategory = false;
  late Category category;
  List<Artist> artistList = [];
  late String genre;
  late Artist artist;
  int? rounds;

  void selectCategory(Category category) {
    this.category = category;
  }

  void selectRounds(int rounds){
    this.rounds = rounds;
    notifyListeners();
  }

  void selectGenre(String genre) {
    this.genre = genre;
  }

  void selectArtist(Artist artist) {
    this.artist = artist;
  }

  Future<void> getSubCategory() async{
    gettingSubCategory = false;
    switch(category) {
      case Category.genre:
        genreList = await _gameRepository.getGenre();
        break;
      case Category.artist:
        artistList = await _gameRepository.getArtists();
        break;
    }

    gettingSubCategory = true;
    notifyListeners();
  }


}