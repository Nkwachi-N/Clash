import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../core/models/game.dart';



class GenreWaitingRoomViewModel extends BaseViewModel{

  final _userDatabaseService = locator<UserDatabaseService>();

  final _gameRepository = locator<GameService>();
  final _fireBaseService = locator<FireBaseService>();
  final _navigationService = locator<NavigationService>();


  String get hostName => game?.host?.name.toUpperCase() ?? '';
  String get hostAvatar => game?.host?.avatar ?? '';

  String get guestName => game?.guest?.name.toUpperCase() ?? '';
  String get guestAvatar => game?.guest?.avatar ?? '';

 String get genre => '';

 int get rounds => _gameRepository.rounds ?? 0;

 Game?  get game => _gameRepository.game;


  void navigateToCreateClashRoom() {
    _navigationService.navigateTo(Routes.createRoomView);
  }


}