import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/repository/repository.dart';
import '../../models/artists.dart';
import '../../models/game.dart';
import '../../models/http_response.dart';
import '../../util/notification_util.dart';


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

class GameRepository{
  final _userRepository = locator<UserRepository>();
  final _spotifyRepository = locator<SpotifyRepository>();

  List<String> genreList = [];
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
  }

  void selectGenre(String genre) {
    this.genre = genre;
  }

  void selectArtist(Artist artist) {
    this.artist = artist;
  }

  Future<void> getSubCategory() async {
    switch (category) {
      case Category.genre:
       await _getGenre();
        break;
      case Category.artist:
        await _getArtist();
        break;
    }
  }

  Future<void> _getGenre() async {
    genreList = await _spotifyRepository.getGenre();
  }

  Future<void> _getArtist() async {
    artistList = await _spotifyRepository.getUserTopArtists();

  }



  void cancelNotifcation() {
    //call cancel notifcation in case user hasn't received it.
    //
  }

  Future<bool> decide(String userName, InviteState inviteState) async {
    _decidingInvite = true;
    _inviteState = inviteState;
    bool status = false;
    final user = await _userRepository.getUserByUserName(userName);

    if (user != null) {
      if (inviteState == InviteState.accepted) {
        status = await NotificationUtil.acceptInvite(user.id, userName);
      } else {
        status = await NotificationUtil.rejectInvite(user.id, userName);
      }
    }
    _decidingInvite = false;
    _inviteState = InviteState.unDecided;
    return status;
  }



}