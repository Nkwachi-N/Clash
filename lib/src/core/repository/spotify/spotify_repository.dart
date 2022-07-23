import 'dart:convert';
import 'package:clash_flutter/src/core/constants/constants.dart';
import 'package:clash_flutter/src/core/models/http_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:pkce/pkce.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/dio_util.dart';
import '../../models/artists.dart';
import '../../models/track.dart';
import '../../secret_keys.dart';
import 'spotify_route.dart';



class SpotifyRepository{
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
      'redirect_uri': SpotifyRoute.kRedirectUri,
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
      'redirect_uri': SpotifyRoute.kRedirectUri,
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
      _saveToken(prefs, response.data);
      return true;
    } catch (_) {
      return false;
    }
  }


  void _saveToken(SharedPreferences prefs, Map<String,dynamic> response) {
    prefs.setString(PrefConstants.kAccessToken, response['access_token']);
    prefs.setString(PrefConstants.kRefreshToken, response['refresh_token']);
  }

  
  Future<String?> getUserId() async {

    try{
      final response = await _dioUtil.get(
        SpotifyRoute.getUserInfo,
      );

      return response['id'];
    }catch(_){
      return null;
    }

  }

  Future<List<Artist>> getUserTopArtists() async {
    try {
      final response = await _dioUtil.get(SpotifyRoute.getUserTopArtists);


        final list = response['items']
            .map<Artist>((json) => Artist.fromJson(json))
            .toList();
        return list;

    } catch (_) {
      return <Artist>[];
    }
  }

  Future<List<String>> getGenre() async {
    try {
      final response = await _dioUtil.get(SpotifyRoute.getGenre);

      final list = response['genres']
          .map<String>((json) => json as String)
          .toList();

      return list;
    } catch (e) {
      return <String>[];
    }
  }

  Future<List<Track>> searchByGenre(
    String query,
    String genre, {
    int offset = 0,
  }) async {
    final response = await _search(
      '$query genre:$genre',
      offset: offset,
    );
    return  _parseTrackResponse(response);
  }

  Future<Map<String, dynamic>> _search(
    String query, {
    int offset = 0,
    int limit = kSearchSize,
    String type = 'track',
  }) async {
    return _dioUtil.get(SpotifyRoute.search, queryParameters: {
      'q': query,
      'type': type,
      'limit': limit.toString(),
      'offset': offset.toString(),
    });
  }

  List<Track> _parseTrackResponse(Map<String, dynamic> data) {
    try{
      return data['tracks']['items']
          .map<Track>((json) => Track.fromJson(json))
          .toList();
    } catch(_) {
      return  <Track>[];
    }

  }

  Future<Status> refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString(PrefConstants.kRefreshToken);


    final data = {
      'grant_type': 'refresh_token',
      'refresh_token': refreshToken,
      'client_id': kClientId,
    };

    final header = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    try {
      final response = await _dio.post(SpotifyRoute.autGetTokenUrl,
          data: data, options: Options(headers: header),);
      _saveToken(prefs, response.data);
      return Status.success;
    } on DioError  catch (e){
      if(e.response?.statusCode == 400) {
        //TODO:navigate to home screen
      }
      return Status.unknown;
    }catch(e){
      return Status.unknown;
    }
  }
}
