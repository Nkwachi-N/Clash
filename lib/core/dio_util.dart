import 'dart:convert';
import 'package:clash_flutter/core/constants.dart';
import 'package:clash_flutter/core/secret_keys.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_route.dart';

class DioUtil {
  DioUtil._();

  static final _dioUtil = DioUtil._();

  factory DioUtil() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.headers.containsKey("requiresToken") &&
              options.headers["requiresToken"]) {
            options.headers.remove("requiresToken");
            final prefs = await SharedPreferences.getInstance();

            final token = prefs.getString(kAccessToken);
            if (token != null) {
              options.headers.addAll({"Authorization": "Bearer $token"});
            }

            return handler.next(options);
          }
        },
      ),
    );
    return _dioUtil;
  }

  static final Dio _dio = Dio();

  Future<dynamic> post(String url,
      {Map<String, dynamic>? data, bool requiresToken = true}) async {
    try {
      final response = await _dio.post(url,
          data: data,
          options: Options(headers: {
            'requiresToken': requiresToken,
          }));

      return response;
    } on Exception {
      return null;
    }
  }

  Future<dynamic> get(String url, {bool requiresToken = true}) async {

    try {
      final response = await _dio.get(url,
          options: Options(headers: {
            'requiresToken': requiresToken,
          }));

      return response.data;
    } on DioError catch (e) {
      if(e.response?.statusCode == 401) {
        await _refreshToken();
        get(url);
      }
      return null;
    }
  }

  Future<void> _refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString(kRefreshToken);

    final _data = {
      'grant_type': 'refresh_token',
      'refresh_token': refreshToken,
      'client_id': kClientId,
    };

    Codec<String, String> stringToBase64 = utf8.fuse(base64);

    final encodedString = stringToBase64.encode('$kClientId:$kSecretKey');
    final _header = {
      'Authorization': 'Basic $encodedString',
      'Content-Type': 'application/x-www-form-urlencoded',
    };



    try {

      final response = await Dio().post(ApiRoute.autGetTokenUrl,
          data: _data, options: Options(headers: _header));

      final accessToken = response.data['access_token'];
      prefs.setString(kAccessToken, accessToken);
    } on DioError catch(e){
    }
  }
}


