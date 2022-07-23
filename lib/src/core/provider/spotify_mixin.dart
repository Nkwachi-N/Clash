import 'package:clash_flutter/spotify/spotify_repository.dart';

mixin SpotifyMixin {

  SpotifyRepository? spotifyRepository;

  initialiseSpotifyRepo(SpotifyRepository spotifyRepository) {
    this.spotifyRepository = spotifyRepository;
  }
}