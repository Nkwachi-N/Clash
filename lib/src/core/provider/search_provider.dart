import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import '../models/http_response.dart';
import '../models/track.dart';

class SearchProvider extends ChangeNotifier{

  List<Track> tracks = [];
  final  _spotifyRepository = locator<SpotifyRepository>();

  bool _searching = false;

  bool get searching => _searching;



  Future<void> searchTracks(String query,String genre) async {
    _searching = true;
    final response = await _spotifyRepository.searchByGenre(query, genre);
    tracks = response;
    _searching = false;
    notifyListeners();

  }


}