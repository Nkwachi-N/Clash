import 'package:clash_flutter/core/api_route.dart';
import 'package:clash_flutter/core/dio_util.dart';
import 'package:clash_flutter/core/models/artists.dart';
import 'package:clash_flutter/core/models/http_response.dart';

class GameRepository{

  final _dioUtil = DioUtil();

  Future<HttpResponse<List<String>>> getGenre() async {

    try{
      final response =  await _dioUtil.get(ApiRoute.getGenre);

      if(response.status == Status.success) {
        try{
          final list = response.data!['genres'].map<String>((json) => json as String).toList();
          return HttpResponse(status: Status.success,data: list);
        }catch(e){
          return HttpResponse(status: response.status,data: <String>[]);
        }

      }
      return HttpResponse(status: response.status,data: <String>[]);
    }catch(e){

      return HttpResponse(status: Status.unknown,data: <String>[]);

    }
  }

  Future<HttpResponse<List<Artist>>> getArtists() async{
    try{
      final response = await _dioUtil.get(ApiRoute.getUserTopArtists);

      if(response.status == Status.success) {

        final list = response.data!['items'].map<Artist>((json) => Artist.fromJson(json)).toList();
        return HttpResponse(status: Status.success,data: list);
      }

      return HttpResponse(status: response.status,data: <Artist>[]);

    }catch(_){
      return HttpResponse(status: Status.failed,data: <Artist>[]);
    }
  }



}