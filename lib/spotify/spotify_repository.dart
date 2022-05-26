import 'dart:convert';

import 'package:clash_flutter/core/constants.dart';
import 'package:clash_flutter/core/dio_util.dart';
import 'package:clash_flutter/core/models/artists.dart';
import 'package:clash_flutter/core/models/track.dart';
import 'package:clash_flutter/core/secret_keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:pkce/pkce.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/models/http_response.dart';
import 'spotify_route.dart';
import 'package:http/http.dart' as http;

class SpotifyRepository {
  static const state = 'HappyBaby257';
  final _dio = Dio();

  final _dioUtil = DioUtil();

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

    final data = {
      'grant_type': 'authorization_code',
      'code': code,
      'redirect_uri': Constants.kRedirectUri,
      'client_id': kClientId,
      'code_verifier': codeVerifier
    };

    Codec<String, String> stringToBase64 = utf8.fuse(base64);

    final encodedString = stringToBase64.encode('$kClientId:$kSecretKey');
    final header = {
      'Authorization': 'Basic $encodedString',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    try {
      final response = await _dio.post(SpotifyRoute.autGetTokenUrl,
          data: data, options: Options(headers: header));
      print('response is ${response.data}');
      final accessToken = response.data['access_token'];
      final refreshToken = response.data['refresh_token'];
      prefs.setString(Constants.kAccessToken, accessToken);
      prefs.setString(Constants.kRefreshToken, refreshToken);


      return true;
    } catch (_) {
      return false;
    }
  }

  Future<String?> getUserId() async {
    final response = await _dioUtil.get(
      SpotifyRoute.getUserInfo,
    );

    return response.data!['id'];
  }

  Future<HttpResponse<List<Artist>>> getUserTopArtists() async {
    try {
      final response = await _dioUtil.get(SpotifyRoute.getUserTopArtists);

      if (response.status == Status.success) {
        final list = response.data!['items']
            .map<Artist>((json) => Artist.fromJson(json))
            .toList();
        return HttpResponse(status: Status.success, data: list);
      }

      return HttpResponse(status: response.status, data: <Artist>[]);
    } catch (_) {
      return HttpResponse(status: Status.failed, data: <Artist>[]);
    }
  }

  Future<HttpResponse<List<String>>> getGenre() async {
    try {
      final response = await _dioUtil.get(SpotifyRoute.getGenre);

      if (response.status == Status.success) {
        try {
          final list = response.data!['genres']
              .map<String>((json) => json as String)
              .toList();
          return HttpResponse(status: Status.success, data: list);
        } catch (e) {
          return HttpResponse(status: response.status, data: <String>[]);
        }
      }
      return HttpResponse(status: response.status, data: <String>[]);
    } catch (e) {
      return HttpResponse(status: Status.unknown, data: <String>[]);
    }
  }

  Future<HttpResponse<List<Track>>> searchByGenre(
    String query,
    String genre, {
    int offset = 0,
  }) async {
    final response = await _search(
      '$query genre:$genre',
      offset: offset,
    );
    if (response.status == Status.success) {
      return HttpResponse(
          status: Status.success, data: _parseTrackResponse(response.data!));
    }
    return HttpResponse(status: response.status);
  }

  Future<HttpResponse<Map<String, dynamic>>> _search(
    String query, {
    int offset = 0,
    int limit = Constants.kSearchSize,
    String type = 'track',
  }) async {
    return await _dioUtil.get(SpotifyRoute.search, queryParameters: {
      'q': query,
      'type': type,
      'limit': limit.toString(),
      'offset': offset.toString(),
    });
  }

  List<Track> _parseTrackResponse(Map<String, dynamic> data) {
    return data['tracks']['items']
        .map<Track>((json) => Track.fromJson(json))
        .toList();
  }

  Future<Status> refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString(Constants.kRefreshToken);


    final data = {
      'grant_type': 'refresh_token',
      'refresh_token': refreshToken,
      'client_id': kClientId,
    };

    Codec<String, String> stringToBase64 = utf8.fuse(base64);

    final encodedString = stringToBase64.encode('$kClientId:$kSecretKey');
    final header = {
      // 'Authorization': 'Basic $encodedString',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    print(jsonEncode(data));
    try {
      final response = await _dio.post(SpotifyRoute.autGetTokenUrl,
          data: data, options: Options(headers: header),);
      print('response is ${response.data}');

      return Status.success;
    } on DioError  catch (e){
      print(e.response?.data);
      return Status.failed;
    }catch(e){
      return Status.unknown;
    }
  }
}
