import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/app/index.dart';

class RoundsViewModel extends BaseViewModel{

  final _gameRepository = locator<GameRepository>();

  selectRounds(int rounds) {
    _gameRepository.selectRounds(rounds);
    //TODO: navigate to waiting room screen
  }


}