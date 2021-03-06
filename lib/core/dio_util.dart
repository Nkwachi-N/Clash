import 'dart:convert';
import 'dart:io';
import 'package:clash_flutter/core/constants.dart';
import 'package:clash_flutter/core/models/http_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Future<HttpResponse<Map<String, dynamic>>> get(String url,
      {bool requiresToken = true,
      Map<String, String>? queryParameters}) async {
    final Map<String, String> header = {};
    if (requiresToken) {
      if (token == null || (token?.isEmpty ?? true)) {
        await _initToken();
      }
      header['Authorization'] = 'Bearer $token';
    }

    try {
      final uri = Uri.parse(url).replace(queryParameters: queryParameters);

      final response = await http.get(
        uri,
        headers: header,
      );


    /*  if (response.statusCode == 401) {
        return await _retryGetResponse(url, requiresToken);
      } else*/ if (response.statusCode == 200) {
        return HttpResponse(
          status: Status.success,
          data: jsonDecode(response.body),
        );
      } else if (response.statusCode == 403) {
        return HttpResponse(
          status: Status.rateExceeded,
          data: jsonDecode(response.body),
        );
      } else {
        return HttpResponse(
          status: Status.unknown,
        );
      }
    } on SocketException {
      return HttpResponse(
        status: Status.noInternet,
      );
    } catch (e) {
      return HttpResponse(
        status: Status.unknown,
      );
    }
  }


  static Future<void> _initToken() async {
    final prefs = await SharedPreferences.getInstance();

    token = prefs.getString(Constants.kAccessToken) ?? '';
  }

/*  Future<HttpResponse<Map<String, dynamic>>> _retryGetResponse(
      String url, bool requiresToken) async {
    final refreshResponse = await _refreshToken();
    if (refreshResponse == Status.success) {
      final Map<String, String> header = {};
      if (requiresToken) {
        final prefs = await SharedPreferences.getInstance();
        token = prefs.getString(Constants.kAccessToken);
        header['Authorization'] = 'Bearer $token';
      }
      final response = await http.get(Uri.parse(url), headers: header);
      if (response.statusCode == 200) {
        return HttpResponse(
            status: Status.success,
            data: jsonDecode(response.body));
      }
      return HttpResponse(status: Status.failed);
    }
    return HttpResponse(status: Status.reAuthenticate);
  }*/
}
