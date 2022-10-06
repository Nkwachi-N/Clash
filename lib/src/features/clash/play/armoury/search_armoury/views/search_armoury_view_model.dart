import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:spotify_flutter/spotify_flutter.dart';
import 'package:stacked/stacked.dart';
import '../../../../../../core/app/app.locator.dart';
import '../../../../../../core/services/service.dart';

class SearchArmouryViewModel extends BaseViewModel {
  List<Track> tracks = [];

  final textEditingController = useTextEditingController();
  final _audioService = locator<AudioService>();
  final _spotifyRepository = locator<SpotifyService>();

  init() {
    textEditingController.addListener(() {
      final value = textEditingController.text;
      if (value.isNotEmpty) {
        _audioService.stopMusic();

        _search(value);
      }
    });
  }

  Future<void> _search(String genre) async {
    setBusy(true);
    tracks = await _spotifyRepository.searchTracksByGenre(genre);
    setBusy(false);
  }
}
