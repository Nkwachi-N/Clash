import 'package:clash_flutter/core/api_route.dart';
import 'package:clash_flutter/core/dio_util.dart';
import 'package:clash_flutter/core/models/artists.dart';

class GameRepository{

  final _dioUtil = DioUtil();

  Future<List<String>> getGenre() async {

    try{
      final response =  await _dioUtil.get(ApiRoute.getGenre);
      return response['genres'].map<String>((json) => json as String).toList();
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<Artist>> getArtists() async{
    try{
      final response = await _dioUtil.get(ApiRoute.getUserTopArtists);
      return response['items'].map<Artist>((json) => Artist.fromJson(json)).toList();
    }catch(e){
      print(e);
    }
    return [];
  }

}