import 'package:clash_flutter/src/ExternalCloseSheet.dart';
import 'package:clash_flutter/src/core/constants/snack_bar_type.dart';
import 'package:clash_flutter/src/features/clash/play/armoury/search_armoury/armour_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_flutter/spotify_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../../core/app/app.locator.dart';
import '../../../../../../core/services/service.dart';

class SearchArmouryViewModel extends BaseViewModel {
  final _snackBarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _gameService = locator<GameService>();

  List<Track> tracks = [];

  List<Track> get addedTracks => _gameService.addedTracks.toList();


  int get rounds => _gameService.game?.rounds ?? 5;

  final textEditingController = TextEditingController();
  final _audioService = locator<AudioService>();
  final _spotifyRepository = locator<SpotifyService>();

  init() {
    textEditingController.addListener(() {
      final value = textEditingController.text;
      if (value.isNotEmpty) {
        _audioService.stopMusic();

        search(value);
      }
    });
  }

  Future<void> search(String genre) async {
    setBusy(true);
    tracks = await _spotifyRepository.searchTracksByGenre(
      genre,
    );
    setBusy(false);
  }

  addTracks(Track track) {
    if(addedTracks.length < rounds) {
      _gameService.addTracksToArmoury(track);
      _snackBarService.showCustomSnackBar(
        message: '${track.name} added to your armoury, let\'s go!!',
        variant: SnackBarType.message,
      );
      notifyListeners();
    } else {
      _snackBarService.showSnackbar(message: 'Please remove songs to add more');
    }

  }

  openArmourySheet() {
    final context = StackedService.navigatorKey?.currentContext;

    if (context == null) return;

    ExternalCloseSheet.showModal(
      context,
      child: ArmourSheet(
        onClashPressed:  tracks.length < rounds ? null :  () => onClashPressed,
        onRemoveTapped: onRemoveTapped,
        tracks: addedTracks,
        rounds: rounds,
      ),
    );
  }

  void onClashPressed() {}

  void onRemoveTapped() {}
}
