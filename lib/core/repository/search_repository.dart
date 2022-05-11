import 'package:clash_flutter/core/api_route.dart';
import 'package:clash_flutter/core/constants.dart';
import 'package:clash_flutter/core/dio_util.dart';
import 'package:clash_flutter/core/models/http_response.dart';
import 'package:clash_flutter/core/models/track.dart';

enum SearchType {
  track,
  album,
  artist,
}

class SearchRepository {
  final _dioUtil = DioUtil();

  Future<HttpResponse<List<Track>>> searchByGenre(
    String query,
    String genre, {
    int offset = 0,
  }) async {
    final response = await _search(
      '$query genre:$genre',
      offset: offset,
    );
    if (response.status == Status.success) {
      return HttpResponse(
          status: Status.success, data: _parseTrackResponse(response.data!));
    }
    return HttpResponse(status: response.status);
  }

  Future<HttpResponse<Map<String, dynamic>>> _search(
    String query,{
    int offset = 0,
    int limit = Constants.kSearchSize,
     String type = 'track',
  }) async {

    return await _dioUtil.get(ApiRoute.search, queryParameters: {
      'q': query,
      'type': type,
      'limit': limit.toString(),
      'offset': offset.toString(),
    });
  }

  List<Track> _parseTrackResponse(Map<String, dynamic> data) {
    return data['tracks']['items']
        .map<Track>((json) => Track.fromJson(json))
        .toList();
  }
}
