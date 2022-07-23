import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:stacked/stacked.dart';

class WaitingRoomViewModel extends BaseViewModel{

  final _userRepository = locator<UserRepository>();

  final _gameRepository = locator<GameRepository>();

  String get name => _userRepository.u;


}