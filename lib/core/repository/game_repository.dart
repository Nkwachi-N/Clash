import 'package:clash_flutter/core/api_route.dart';
import 'package:clash_flutter/core/dio_util.dart';
import 'package:clash_flutter/core/models/artists.dart';
import 'package:clash_flutter/core/models/http_response.dart';

class GameRepository{

  final _dioUtil = DioUtil();

  Future<HttpResponse<List<String>>> getGenre() async {

    try{
      final response =  await _dioUtil.get(ApiRoute.getGenre);

      if(response.responseStatus == ResponseStatus.success) {
        try{
          final list = response.data!['genres'].map<String>((json) => json as String).toList();
          return HttpResponse(responseStatus: ResponseStatus.success,data: list);
        }catch(e){
          return HttpResponse(responseStatus: response.responseStatus,data: <String>[]);
        }

      }
      return HttpResponse(responseStatus: response.responseStatus,data: <String>[]);
    }catch(e){

      return HttpResponse(responseStatus: ResponseStatus.unknown,data: <String>[]);

    }
  }

  Future<HttpResponse<List<Artist>>> getArtists() async{
    try{
      final response = await _dioUtil.get(ApiRoute.getUserTopArtists);

      if(response.responseStatus == ResponseStatus.success) {

        final list = response.data!['items'].map<Artist>((json) => Artist.fromJson(json)).toList();
        return HttpResponse(responseStatus: ResponseStatus.success,data: list);
      }

      return HttpResponse(responseStatus: response.responseStatus,data: <Artist>[]);

    }catch(_){
      return HttpResponse(responseStatus: ResponseStatus.failed,data: <Artist>[]);
    }
  }



}