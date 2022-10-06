import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../core/models/game.dart';
import '../../../../../core/models/user.dart';


class WaitingRoomViewModel extends BaseViewModel{

  final _userDatabaseService = locator<UserDatabaseService>();

  final _gameRepository = locator<GameService>();
  final _navigationService = locator<NavigationService>();

  User? get user => _userDatabaseService.getCurrentUser();

  String get name => user?.name.toUpperCase() ?? '';

  String get avatar => user?.avatar ?? '';

  String get categoryName => _gameRepository.category.name;

  bool get categoryIsGenre => _gameRepository.category == Category.genre;

 String get genre => _gameRepository.genre;

 int get rounds => _gameRepository.rounds ?? 0;


  void navigateToCreateClashRoom() {
    _navigationService.navigateTo(Routes.createRoomView);
  }
}