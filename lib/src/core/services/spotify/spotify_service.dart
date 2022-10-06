import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/constants/snack_bar_type.dart';
import 'package:spotify_flutter/spotify_flutter.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../secret_keys.dart';
import 'spotify_route.dart';

class SpotifyService {
  static const state = 'HappyBaby257';
  final _callBackUrlScheme = 'clash';
  final _snackBarService = locator<SnackbarService>();
  final _spotifyApi = SpotifyApi.instance;

  Future<bool> authorize() async {
    final response = await _spotifyApi.authenticate(
      redirectUri: SpotifyRoute.kRedirectUri,
      clientId: kClientId,
      callbackUrlScheme: _callBackUrlScheme,
      secretKey: kSecretKey,
    );
    bool result = false;
    response.when(success: (success) {
      result = success;
    }, failure: (failure) {
      _snackBarService.showCustomSnackBar(
          message: NetworkExceptions.getErrorMessage(failure),
          variant: SnackBarType.error);
    });

    return result;
  }

  Future<GetCurrentUserProfileResponse?> getUser() async {
    try{
      final response = await _spotifyApi.getCurrentUsersProfile();
      GetCurrentUserProfileResponse? result;
      response.when(success: (success) {
        result = success;
      }, failure: (failure) {
        //TODO: handle
      });

      return result;
    }catch(e) {
      print('Exception is $e');
    }
    return null;

  }

  Future<List<Artist>> getUserTopArtists() async {
    final response = await _spotifyApi.getUserTopArtists();
    List<Artist> result = [];
    response.when(success: (success) {
      result = success.items ?? <Artist>[];
    }, failure: (failure) {
      _snackBarService.showCustomSnackBar(
          message: NetworkExceptions.getErrorMessage(failure),
          variant: SnackBarType.error);
    });

    return result;
  }

  Future<List<String>> getGenre() async {
    final response = await _spotifyApi.getAvailableGenreSeeds();
    List<String> result = [];
    response.when(success: (success) {
      result = success.genres;
    }, failure: (failure) {
      _snackBarService.showCustomSnackBar(
          message: NetworkExceptions.getErrorMessage(failure),
          variant: SnackBarType.error);
    });

    return result;
  }

  Future<List<Track>> searchTracksByGenre(String genre) async{
    final response = await _spotifyApi.getTracksByGenre(genre: genre);
    List<Track> result = [];
    response.when(success: (success) {
      result = success.tracks?.items ?? <Track>[];
    }, failure: (failure) {
      _snackBarService.showCustomSnackBar(
          message: NetworkExceptions.getErrorMessage(failure),
          variant: SnackBarType.error);
    });

    return result;
  }

  Future<List<Artist>> searchTracksByArtist(String artist) async{
    final response = await _spotifyApi.getTracksByArtist(artist: artist);
    List<Artist> result = [];
    response.when(success: (success) {
      result = success.artists?.items ?? <Artist>[];
    }, failure: (failure) {
      _snackBarService.showCustomSnackBar(
          message: NetworkExceptions.getErrorMessage(failure),
          variant: SnackBarType.error);
    });

    return result;
  }
}
