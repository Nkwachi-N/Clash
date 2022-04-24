import 'dart:convert';
import 'package:clash_flutter/core/constants.dart';
import 'package:clash_flutter/core/models/http_response.dart';
import 'package:clash_flutter/core/secret_keys.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_route.dart';
import 'package:http/http.dart' as http;

class DioUtil {
  DioUtil._();

  static final _dioUtil = DioUtil._();
   static String? token;

  factory DioUtil() {
    _initToken();
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.headers.containsKey("requiresToken") &&
              options.headers["requiresToken"]) {
            options.headers.remove("requiresToken");

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

  Future<HttpResponse<Map<String,dynamic>>> get(String url, {bool requiresToken = true}) async {
    final Map<String,String> header = {};
    if(requiresToken) {
      header['Authorization'] = 'Bearer $token';
    }

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: header,
      );

      if(response.statusCode == 401) {
        return await _retryGetResponse(url,requiresToken);
      }

      return HttpResponse(responseStatus: ResponseStatus.success,data: jsonDecode(response.body));
    } catch (e){
      return HttpResponse(responseStatus: ResponseStatus.unknown);
    }
  }

  Future<ResponseStatus> _refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString(Constants.kRefreshToken);

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
      final response = await http.post(
        Uri.parse(ApiRoute.autGetTokenUrl),
        body: _data,
        headers: _header,
      );

      if(response.statusCode == 400) {
        return ResponseStatus.reAuthenticate;
      }

      final accessToken = jsonDecode(response.body)['access_token'];
      prefs.setString(Constants.kAccessToken, accessToken);
      return ResponseStatus.success;

    }  catch (e) {

      return ResponseStatus.unknown;
     
    }
  }

  static Future<void> _initToken() async{
    final prefs = await SharedPreferences.getInstance();

    token = prefs.getString(Constants.kAccessToken) ?? '';
  }

 Future<HttpResponse<Map<String,dynamic>>> _retryGetResponse(String url, bool requiresToken) async {
    final refreshResponse = await _refreshToken();
    if(refreshResponse == ResponseStatus.success) {
      final Map<String,String> header = {};
      if(requiresToken) {
        final prefs = await SharedPreferences.getInstance();
        token = prefs.getString(Constants.kAccessToken);
        header['Authorization'] = 'Bearer $token';
      }
      final response = await http.get(Uri.parse(url),headers: header);
      if(response.statusCode == 200 ) {
        return HttpResponse(responseStatus: ResponseStatus.success,data: jsonDecode(response.body));
      }
      return HttpResponse(responseStatus: ResponseStatus.failed);
    }
    return HttpResponse(responseStatus: ResponseStatus.reAuthenticate);

  }
}
