import 'package:clash_flutter/src/core/services/service.dart';
import 'package:clash_flutter/src/core/services/game/game.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../core/app/index.dart';

class RoundsViewModel extends BaseViewModel{

  final _gameRepository = locator<GameService>();
  final _navigationService = locator<NavigationService>();

  selectRounds(int rounds) {
    _gameRepository.selectRounds(rounds);
    _navigationService.navigateTo(Routes.createRoomView);

  }


}