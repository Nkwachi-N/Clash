import 'dart:convert';

import 'package:clash_flutter/core/api_route.dart';
import 'package:clash_flutter/core/constants.dart';
import 'package:clash_flutter/core/dio_util.dart';
import 'package:clash_flutter/core/secret_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:hive/hive.dart';
import 'package:pkce/pkce.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class AuthRepository {
  static const state = 'HappyBaby257';

  final _dio = Dio();
  final _dioUtil = DioUtil();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<bool> authorize() async {
    final pkcePair = PkcePair.generate();

    const scope =
        'user-read-private user-read-email user-modify-playback-state streaming user-top-read';

    final codeChallenge = pkcePair.codeChallenge.replaceAll('=', '');
    final codeVerifier = pkcePair.codeVerifier;

    final url = Uri.https('accounts.spotify.com', '/authorize', {
      'response_type': 'code',
      'client_id': kClientId,
      'redirect_uri': Constants.kRedirectUri,
      'state': state,
      'code_challenge_method': 'S256',
      'code_challenge': codeChallenge,
      'scope': scope
    });

    try {
      final result = await FlutterWebAuth.authenticate(
        url: url.toString(),
        callbackUrlScheme: 'clash',
      );

      final returnedState = Uri.parse(result).queryParameters['state'];

      if (state == returnedState) {
        final code = Uri.parse(result).queryParameters['code'];

        if (code != null) {
          return await _getToken(code, codeVerifier);
        }
      }
    } on Exception {
      return false;
    }

    return false;
  }

  Future<bool> _getToken(String code, String codeVerifier) async {
    final prefs = await SharedPreferences.getInstance();

    final _data = {
      'grant_type': 'authorization_code',
      'code': code,
      'redirect_uri': Constants.kRedirectUri,
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
      prefs.setString(Constants.kAccessToken, accessToken);
      prefs.setString(Constants.kRefreshToken, refreshToken);

      return true;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<bool> storeUserName(String userName) async {
    bool status = false;
    try {
      String? userId = await _getUserId();

      if (userId != null) {
        status = await _saveUser(User(
          id: userId,
          name: userName,
        ));
      }
    } catch (e) {
      return status;
    }
    return status;
  }

  Future<bool> _saveUser(User user) async {
    bool status = false;

    try {
      await users.doc(user.id).set(user.toMap());
      final box = Hive.box(Constants.kHiveBox);
      box.put('user', user);
      status = true;
    } catch (e) {
      status = false;
    }

    return status;
  }

  Future<bool> saveAvatar(int avatar) async {
    bool status = false;
    try {
      final box = Hive.box(Constants.kHiveBox);
      final User user = box.get('user');
      user.avatar = avatar.toString();
      status = await _saveUser(user);
    } catch (e) {
      return status;
    }
    return status;
  }

  Future<String?> _getUserId() async {
    final response = await _dioUtil.get(
      ApiRoute.getUserInfo,
    );

    return response.data?.data['id'];
  }
}
