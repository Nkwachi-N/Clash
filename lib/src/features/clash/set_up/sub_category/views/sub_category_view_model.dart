import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:clash_flutter/src/core/services/game/game.dart';
import 'package:spotify_flutter/spotify_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../core/models/game.dart';

class SubCategoryViewModel extends BaseViewModel {
  final _gameRepository = locator<GameService>();
  final _navigationService = locator<NavigationService>();

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
    _navigationService.navigateTo(Routes.roundsView);
  }

  void selectGenre(String genre) {
    _gameRepository.selectGenre(genre);
    _navigationService.navigateTo(Routes.roundsView);
  }

  Future<void> getSubCategory() async{
    setBusy(true);
    await _gameRepository.getSubCategory();
    setBusy(false);
  }
}
