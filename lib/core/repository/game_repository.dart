import 'package:clash_flutter/core/api_route.dart';
import 'package:clash_flutter/core/dio_util.dart';
import 'package:clash_flutter/core/models/artists.dart';
import 'package:clash_flutter/core/models/http_response.dart';

class GameRepository{

  final _dioUtil = DioUtil();

  Future<HttpResponse<List<String>>> getGenre() async {

    final response =  await _dioUtil.get(ApiRoute.getGenre);
    if(response.responseStatus == ResponseStatus.success) {
      final list = response.data!.data['genres'].map<String>((json) => json as String).toList();
      return HttpResponse(responseStatus: ResponseStatus.success,data: list);
    }
    return HttpResponse(responseStatus: response.responseStatus,data: <String>[]);
  }

  Future<HttpResponse<List<Artist>>> getArtists() async{
    final response = await _dioUtil.get(ApiRoute.getUserTopArtists);

    if(response.responseStatus == ResponseStatus.success) {

      final list = response.data!.data['items'].map<Artist>((json) => Artist.fromJson(json)).toList();
      return HttpResponse(responseStatus: ResponseStatus.success,data: list);
    }

   return HttpResponse(responseStatus: response.responseStatus,data: <Artist>[]);
  }

}