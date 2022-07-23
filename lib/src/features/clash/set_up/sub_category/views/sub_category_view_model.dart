import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/models/artists.dart';
import '../../../../../core/models/game.dart';

class SubCategoryViewModel extends BaseViewModel {
  final _gameRepository = locator<GameRepository>();

  String get title =>
      _gameRepository.category == Category.artist ? 'an artist' : 'a genre';

  int get itemsCount => _gameRepository.category == Category.genre
      ? _gameRepository.genreList.length
      : _gameRepository.artistList.length;

  bool get isGenre => _gameRepository.category == Category.genre;

  List<Artist> get artistList => _gameRepository.artistList;

  List<String> get genreList => _gameRepository.genreList;

  void selectArtist(Artist artist) {
    _gameRepository.selectArtist(artist);
  }

  void selectGenre(String genre) {
    _gameRepository.selectGenre(genre);
    //TODO:navigate to rounds screen.
  }
}
