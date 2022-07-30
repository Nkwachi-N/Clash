import 'dart:convert';
import 'package:clash_flutter/src/core/app/app.locator.dart';
import 'package:clash_flutter/src/core/constants/constants.dart';
import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/http_response.dart';

class DioUtil {
  DioUtil._();

  static final _dioUtil = DioUtil._();
  // final _spotifyRepository = locator<SpotifyRepository>();
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

  Future<Map<String, dynamic>> get(String url,
      {bool requiresToken = true, Map<String, String>? queryParameters}) async {
    final Map<String, String> header = {};
    if (requiresToken) {
      if (token == null || (token?.isEmpty ?? true)) {
        await _initToken();
      }
      header['Authorization'] = 'Bearer $token';
    }
    late Uri uriString;

    try {
      uriString = Uri.parse(url).replace(queryParameters: queryParameters);

      final response = await http.get(
        uriString,
        headers: header,
      );

      print(response.body);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        try {
          return _retryGetResponse(uriString,requiresToken: requiresToken);

        }catch (_) {
          rethrow;
        }
      } else if (response.statusCode == 403) {
        throw Exception('Rate exceeded');
      } else {
        throw Exception('Unknown error');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> _initToken() async {
    final prefs = await SharedPreferences.getInstance();

    token = prefs.getString(PrefConstants.kAccessToken) ?? '';
  }

  Future<Map<String, dynamic>> _retryGetResponse(Uri url,
      {bool requiresToken = true,}) async {
    final refreshStatus = Status.success;
    if (refreshStatus == Status.success) {
      final Map<String, String> header = {};
      if (requiresToken) {
        if (token == null || (token?.isEmpty ?? true)) {
          await _initToken();
        }
        header['Authorization'] = 'Bearer $token';
      }

      try {
        final response = await http.get(
          url,
          headers: header,
        );
        return jsonDecode(response.body);
      } catch (e) {
        rethrow;
      }
    }else {
      throw Exception('Ooops! something went wrong');
    }

  }
}
