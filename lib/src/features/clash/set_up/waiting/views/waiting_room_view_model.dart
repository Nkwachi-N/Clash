import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/models/game.dart';


class WaitingRoomViewModel extends BaseViewModel{

  final _userRepository = locator<UserRepository>();

  final _gameRepository = locator<GameRepository>();

  String get name => _userRepository.user.name.toUpperCase();

  String get avatar => _userRepository.user.avatar ?? '';

  String get categoryName => _gameRepository.category.name;

  bool get categoryIsGenre => _gameRepository.category == Category.genre;

 String get genre => _gameRepository.genre;

 int get rounds => _gameRepository.rounds ?? 0;




}