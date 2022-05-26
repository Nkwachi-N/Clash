import 'package:clash_flutter/core/models/artists.dart';
import 'package:clash_flutter/core/models/http_response.dart';
import 'package:clash_flutter/core/repository/game_repository.dart';
import 'package:clash_flutter/core/util/notification_util.dart';
import 'package:clash_flutter/core/repository/user_repository.dart';
import 'package:clash_flutter/spotify/spotify_repository.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import '../models/game.dart';

enum InviteState { accepted, declined, unDecided }

extension ParseToString on InviteState {
  String toMessage() {
    switch (this) {
      case InviteState.accepted:
        return 'accepting';
      case InviteState.declined:
        return 'declining';
      case InviteState.unDecided:
        return 'undecided';
    }
  }
}

class GameProvider extends ChangeNotifier{
  GameRepository? _gameRepository;
  UserRepository? _userRepository;
  SpotifyRepository? _spotifyRepository;
  List<String> genreList = [];
  bool gettingSubCategory = false;
  late Category category;
  List<Artist> artistList = [];
  late String genre;
  late Artist artist;
  int? rounds;

  InviteState _inviteState = InviteState.unDecided;

  bool _decidingInvite = false;

  bool get decidingInvite => _decidingInvite;

  InviteState get inviteState => _inviteState;

  bool _invitingUser = false;

  bool get invitingUser => _invitingUser;

  void selectCategory(Category category) {
    this.category = category;
  }

  void selectRounds(int rounds) {
    this.rounds = rounds;
    notifyListeners();
  }

  void selectGenre(String genre) {
    this.genre = genre;
  }

  void selectArtist(Artist artist) {
    this.artist = artist;
  }

  Future<Status> getSubCategory() async {
    gettingSubCategory = true;

    switch (category) {
      case Category.genre:
        return _getGenre();

      case Category.artist:
        return _getArtist();
    }
  }

  Future<Status> _getGenre() async {
    final response = await _spotifyRepository?.getGenre();
    if(response != null) {
      Status status = response.status;

      if (status == Status.success) {
        genreList = response.data ?? [];
      }
      gettingSubCategory = false;
      notifyListeners();

      return status;
    }
    return Status.unknown;

  }

  Future<Status> _getArtist() async {
    final response = await _spotifyRepository?.getUserTopArtists();

    if(response != null) {
      Status status = response.status;

      if (status == Status.success) {
        artistList = response.data ?? [];
      }

      gettingSubCategory = false;
      notifyListeners();
      return status;
    }

    return Status.unknown;

  }

  Future<bool> inviteUser(String userName) async {
    _invitingUser = true;
    bool status = false;
    notifyListeners();
    final user = await _userRepository?.getUserByUserName(userName);
    if (user != null) {
      status = await NotificationUtil.inviteUser(user.id, userName);
    }
    _invitingUser = false;
    notifyListeners();
    return status;
  }

  void cancelNotifcation() {
    //call cancel notifcation in case user hasn't received it.
    //
  }

  Future<bool> decide(String userName, InviteState inviteState) async {
    _decidingInvite = true;
    _inviteState = inviteState;
    notifyListeners();
    bool status = false;
    final user = await _userRepository?.getUserByUserName(userName);

    if (user != null) {
      if (inviteState == InviteState.accepted) {
        status = await NotificationUtil.acceptInvite(user.id, userName);
      } else {
        status = await NotificationUtil.rejectInvite(user.id, userName);
      }
    }
    _decidingInvite = false;
    _inviteState = InviteState.unDecided;
    notifyListeners();
    return status;
  }


  initialise(SpotifyRepository spotifyRepository, UserRepository userRepository, GameRepository gameRepository) {
    _spotifyRepository = spotifyRepository;
    _userRepository = userRepository;
    _gameRepository = gameRepository;
  }
}
