import 'package:clash_flutter/core/api_route.dart';
import 'package:clash_flutter/core/dio_util.dart';

class GameRepository{

  final _dioUtil = DioUtil();

  Future<List<String>> getGenre() async {

    try{
      final response =  await _dioUtil.get(ApiRoute.getGenre);

    } on Exception{

    }
    return [];
  }

}