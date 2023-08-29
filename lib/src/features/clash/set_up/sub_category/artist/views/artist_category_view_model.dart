import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:spotify_flutter/spotify_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ArtistCategoryViewModel extends BaseViewModel {
  final _spotifyRepository = locator<SpotifyService>();
  final _navigationService = locator<NavigationService>();
  final _gameService = locator<GameService>();

  List<Artist> _artistList = [];

  List<Artist> get artistList => _artistList;

  void selectArtist(Artist artist) {
    _gameService.selectArtist(artist);
    _navigationService.navigateTo(Routes.roundsView);
  }

  onReady() {
    _getSubCategory();
  }

  Future<void> _getSubCategory() async {
    setBusy(true);
    _artistList = await _spotifyRepository.getUserTopArtists();
    setBusy(false);
  }
}
