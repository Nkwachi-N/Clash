import 'package:clash_flutter/core/constants.dart';
import 'package:clash_flutter/core/models/http_response.dart';
import 'package:clash_flutter/core/models/track.dart';
import 'package:clash_flutter/core/repository/search_repository.dart';
import 'package:flutter/cupertino.dart';

class SearchProvider extends ChangeNotifier{

  List<Track> tracks = [];
  final _searchRepo = SearchRepository();

  bool _searching = false;

  bool get searching => _searching;



  Future<Status> searchTracks(String query,String genre) async {
    _searching = true;
    final response = await _searchRepo.searchByGenre(query, genre);
    if(response.status == Status.success) {
      tracks = response.data!;
    }
    _searching = false;
    notifyListeners();
    return response.status;
  }
}