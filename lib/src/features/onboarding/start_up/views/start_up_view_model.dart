import 'package:clash_flutter/src/core/services/service.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/app/app.locator.dart';
import '../../../../core/models/user.dart';

class StartUpViewModel extends BaseViewModel {
  final UserDatabaseService _dbService = locator<UserDatabaseService>();
  bool _showLogin = false;

  bool get showLogin => _showLogin;

  set showLogin(bool showLogin) {
    _showLogin = showLogin;
    notifyListeners();
  }


  init() {
    User? user = _dbService.getCurrentUser();
    showLogin = user == null;
  }
}
