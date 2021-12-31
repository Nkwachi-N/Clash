import 'package:clash_flutter/core/api_route.dart';
import 'package:dio/dio.dart';

class AuthRepository{

  final _dio = Dio();

    Future<String?> authorize() async {
      final response = await _dio.get(ApiRoute.authUrl,queryParameters: {
        'response_type' : 'code',
        'redirect_uri' :
      })
    }
}