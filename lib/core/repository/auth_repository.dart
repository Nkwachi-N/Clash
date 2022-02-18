import 'dart:convert';

import 'package:clash_flutter/core/api_route.dart';
import 'package:clash_flutter/core/constants.dart';
import 'package:clash_flutter/core/secret_keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:pkce/pkce.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class AuthRepository {
  static const state = 'HappyBaby257';

  final _dio = Dio();

  Future<bool> authorize() async {
    final pkcePair = PkcePair.generate();

    final codeChallenge = pkcePair.codeChallenge.replaceAll('=', '');
    final codeVerifier = pkcePair.codeVerifier;

    final url = Uri.https('accounts.spotify.com', '/authorize', {
      'response_type': 'code',
      'client_id': kClientId,
      'redirect_uri': kRedirectUri,
      'state': state,
      'code_challenge_method': 'S256',
      'code_challenge': codeChallenge,
    });

    final result = await FlutterWebAuth.authenticate(
      url: url.toString(),
      callbackUrlScheme: 'clash',
    );

    print('Result is $result');

    final returnedState = Uri.parse(result).queryParameters['state'];

    if (state == returnedState) {
      final code = Uri.parse(result).queryParameters['code'];

      if (code != null) {
        return await _getToken(code, codeVerifier);
      }
    }

    return false;
  }

  Future<bool> _getToken(String code, String codeVerifier) async {
    final prefs = await SharedPreferences.getInstance();

    final _data = {
      'grant_type': 'authorization_code',
      'code': code,
      'redirect_uri': kRedirectUri,
      'client_id': kClientId,
      'code_verifier': codeVerifier
    };

    Codec<String, String> stringToBase64 = utf8.fuse(base64);

    final encodedString = stringToBase64.encode('$kClientId:$kSecretKey');
    final _header = {
      'Authorization': 'Basic $encodedString',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    try {
      final response = await _dio.post(ApiRoute.autGetTokenUrl,
          data: _data, options: Options(headers: _header));
      final accessToken = response.data['access_token'];
      final refreshToken = response.data['refresh_token'];
      prefs.setString(kAccessToken, accessToken);
      prefs.setString(kRefreshToken, refreshToken);

      return true;
    } on DioError catch (e) {
      return false;
    }
  }


  Future<void> getUser()

  Future<void> refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString(kRefreshToken);

    final _data = {
      'grant_type': 'refresh_token',
      'code': refreshToken,
      'client_id': kClientId,
    };

    Codec<String, String> stringToBase64 = utf8.fuse(base64);

    final encodedString = stringToBase64.encode('$kClientId:$kSecretKey');
    final _header = {
      'Authorization': 'Basic $encodedString',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    try {
      final response = await _dio.post(ApiRoute.autGetTokenUrl,
          data: _data, options: Options(headers: _header));

      final accessToken = response.data['access_token'];
      prefs.setString(kAccessToken, accessToken);
    } on DioError catch (e) {
      //TODO: Error handling.
      print(e.response?.data);
    }
  }

  Future<User?> getUserInfo() async {
    try {} on Exception {
      return null;
    }
    return null;
  }
}
