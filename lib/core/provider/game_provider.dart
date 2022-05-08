import 'package:clash_flutter/core/models/artists.dart';
import 'package:clash_flutter/core/models/http_response.dart';
import 'package:clash_flutter/core/repository/game_repository.dart';
import 'package:clash_flutter/core/repository/notification_util.dart';
import 'package:clash_flutter/core/repository/user_repository.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import '../models/game.dart';

class GameProvider extends ChangeNotifier {
  final _gameRepository = GameRepository();
  final _userRepository = UserRepository();
  List<String> genreList = [];
  bool gettingSubCategory = false;
  late Category category;
  List<Artist> artistList = [];
  late String genre;
  late Artist artist;
  int? rounds;

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

  Future<ResponseStatus> getSubCategory() async {
    gettingSubCategory = true;

    switch (category) {
      case Category.genre:
        return _getGenre();

      case Category.artist:
        return _getArtist();
    }
  }

  Future<ResponseStatus> _getGenre() async {
    final response = await _gameRepository.getGenre();
    ResponseStatus status = response.responseStatus;

    if (status == ResponseStatus.success) {
      genreList = response.data ?? [];
    }
    gettingSubCategory = false;
    notifyListeners();

    return status;
  }

  Future<ResponseStatus> _getArtist() async {

    final response = await _gameRepository.getArtists();
    ResponseStatus status = response.responseStatus;

    if (status == ResponseStatus.success) {
      artistList = response.data ?? [];
    }

    gettingSubCategory = false;
    notifyListeners();
    return status;
  }

  Future<bool> inviteUser(String userName) async {

    final user = await _userRepository.getUserByUserName(userName);
    if(user != null) {

      return await NotificationUtil.sendNotification(user.id, userName);
    }
    return false;

  }
}
