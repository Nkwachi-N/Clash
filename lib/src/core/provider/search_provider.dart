import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_flutter/spotify_flutter.dart';

class SearchProvider extends ChangeNotifier{

  List<Track> tracks = [];
  List<Artist> artists = [];
  final  _spotifyRepository = locator<SpotifyService>();

  bool _searching = false;

  bool get searching => _searching;



  Future<void> searchTracksByGenre(String genre) async {
    _searching = true;
    final response = await _spotifyRepository.searchTracksByGenre(genre);
    tracks = response;
    _searching = false;
    notifyListeners();
  }

  Future<void> searchTracksByArtist(String artist) async {
    _searching = true;
    final response = await _spotifyRepository.searchTracksByArtist(artist);
    artists = response;
    _searching = false;
    notifyListeners();
  }


}