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
        'user-read-private user-read-email user-modify-playback-state streaming';

    final codeChallenge = pkcePair.codeChallenge.replaceAll('=', '');
    final codeVerifier = pkcePair.codeVerifier;

    final url = Uri.https('accounts.spotify.com', '/authorize', {
      'response_type': 'code',
      'client_id': kClientId,
      'redirect_uri': kRedirectUri,
      'state': state,
      'code_challenge_method': 'S256',
      'code_challenge': codeChallenge,
      'scope': scope
    });

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



  Future<bool> storeUserName(String userName) async {
    bool status = false;
    try {

      String? userId = await _getUserId();

      if (userId != null) {
        status = await saveUser(userName, userId);
        print(status);
      }
    } catch (e) {
      print(e);
      return status;
    }
    return status;
  }

  Future<bool> saveUser(String userName, String userId)  async{
    bool status = false;
    final user = User(
      name: userName,
      id: userId,
    );

    try{
      await users.doc(userId).set(user.toMap());
      print('user added succesfully');
      final box = Hive.box(kHiveBox);
      box.add(user);
      status = true;
    }catch(e){
      print('user added failed');
      status = false;
    }

    return status;
  }

  Future<String?> _getUserId() async {
    final response = await _dioUtil.get(
      ApiRoute.getUserInfo,
    );
    if(response != null) {
      return response['id'];
    }
    return null;
  }


}
