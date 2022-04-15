import 'package:clash_flutter/core/models/artists.dart';
import 'package:clash_flutter/core/models/http_response.dart';
import 'package:clash_flutter/core/repository/game_repository.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import '../models/game.dart';

class GameProvider extends ChangeNotifier {
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

  void selectRounds(int rounds) {
    this.rounds = rounds;
    notifyListeners();
  }

  void selectGenre(String genre) {
    this.genre = genre;
  }

  void selectArtist(Artist artist) {
    this.artist = artist;
  }

  Future<ResponseStatus> getSubCategory() async {
    gettingSubCategory = false;
    switch (category) {
      case Category.genre:
        return _getGenre();

      case Category.artist:
        return _getArtist();
    }
  }

  Future<ResponseStatus> _getGenre() async {
    final response = await _gameRepository.getGenre();
    ResponseStatus status = response.responseStatus;

    if (status == ResponseStatus.success) {
      genreList = response.data ?? [];
    }
    gettingSubCategory = true;
    notifyListeners();

    return status;
  }

  Future<ResponseStatus> _getArtist() async {
    final response = await _gameRepository.getArtists();
    ResponseStatus status = response.responseStatus;

    if (status == ResponseStatus.success) {
      artistList = response.data ?? [];
    }

    gettingSubCategory = true;
    notifyListeners();
    return status;
  }
}
