import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:clash_flutter/src/core/services/game/game.dart';
import 'package:spotify_flutter/spotify_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GenreCategoryViewModel extends BaseViewModel {
  final _spotifyRepository = locator<SpotifyService>();
  final _navigationService = locator<NavigationService>();
  final _gameService = locator<GameService>();

  List<String> _genreList = [];

  List<String> get genreList => _genreList;

  void selectGenre(String genre) {
    _gameService.selectGenre(genre);
    _navigationService.navigateTo(Routes.roundsView);
  }

  onReady() {
    _getSubCategory();
  }

  Future<void> _getSubCategory() async {
    setBusy(true);
    _genreList = await _spotifyRepository.getGenre();
    setBusy(false);
  }
}
