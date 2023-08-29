import 'package:clash_flutter/src/core/api/api_client.dart';
import 'package:clash_flutter/src/core/app/index.dart';
import 'package:dio/dio.dart';
import 'package:spotify_flutter/spotify_flutter.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../secret_keys.dart';
import 'spotify_route.dart';

class SpotifyService {
  static const state = 'HappyBaby257';
  final _callBackUrlScheme = 'clash';
  final _snackBarService = locator<SnackbarService>();

  final _authClient = spotifyApiGateway.authClient;
  final _userClient = spotifyApiGateway.userClient;
  final _genreClient = spotifyApiGateway.genreClient;

  Future<GetTokenResponse?> authorize() async {
    try {
      final keyPair = _authClient.getKeyPair();
      final code = await _authClient.authorize(
        redirectUri: SpotifyRoute.kRedirectUri,
        clientId: kClientId,
        callbackUrlScheme: _callBackUrlScheme,
        secretKey: kClientId,
        scope:
            'user-read-private user-read-email user-library-read user-library-modify user-top-read '
            'user-follow-modify playlist-modify-public playlist-modify-private user-follow-read',
        codeChallenge: keyPair.codeChallenge,
      );

      if (code == null) return null;
      final response = await _authClient.getToken(
        code: code,
        codeVerifier: keyPair.codeVerifier,
        redirectUri: SpotifyRoute.kRedirectUri,
        clientId: kClientId,
        secretKey: kClientId,
      );

      return response;
    } on DioError catch (e) {
      getLogger(toString()).e(e);
    }
    return null;
  }

  Future<UserProfile?> getUser() async {
    try {
      final response = await _userClient.getCurrentUsersProfile();
      return response;
    } on DioError catch (e) {
      getLogger(toString()).e(e);
    }
    return null;
  }

  Future<List<Artist>> getUserTopArtists() async {
    List<Artist> result = [];
    try {
      final response = await _userClient.getUserTopArtists();

      result = response.items ?? [];
    } on DioError catch (e) {
      getLogger(toString()).e(e);
    }
    return result;
  }

  Future<List<String>> getGenre() async {
    try {
      final response = await _genreClient.getAvailableGenreSeeds();
      return response.genres;
    } on DioError {}
    return [];
  }

  Future<List<Track>> searchTracksByGenre(String genre) async {
    // final response =
    //     await _spotifyApi.getTracksByGenre(genre: genre, limit: 10);
    List<Track> result = [];
    /* response.when(success: (success) {
      result = success.tracks?.items ?? <Track>[];
    }, failure: (failure) {
      _snackBarService.showCustomSnackBar(
          message: NetworkExceptions.getErrorMessage(failure),
          variant: SnackBarType.error);
    });*/

    return result;
  }

  Future<List<Artist>> searchTracksByArtist(String artist) async {
    // final response = await _spotifyApi.getTracksByArtist(artist: artist);
    List<Artist> result = [];
/*    response.when(success: (success) {
      result = success.artists?.items ?? <Artist>[];
    }, failure: (failure) {
      _snackBarService.showCustomSnackBar(
          message: NetworkExceptions.getErrorMessage(failure),
          variant: SnackBarType.error);
    });*/

    return result;
  }
}
