import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import '../../../../../../core/app/app.locator.dart';
import '../../../../../../core/models/track.dart';
import '../../../../../../core/repository/repository.dart';

class SearchArmouryViewModel extends BaseViewModel {
  List<Track> tracks = [];

  final textEditingController = useTextEditingController();
  final _audioService = locator<AudioService>();
  final _spotifyRepository = locator<SpotifyRepository>();

  init() {
    textEditingController.addListener(() {
      final value = textEditingController.text;
      if (value.isNotEmpty) {
        _audioService.stopMusic();

        _search(value);
      }
    });
  }

  Future<void> _search(String value) async {
    setBusy(true);
    tracks = await _spotifyRepository.searchByGenre(value, 'afrobeat');
    setBusy(false);
  }
}
