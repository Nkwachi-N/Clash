import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthViewModel extends BaseViewModel {
  final _userRepository = locator<UserRepository>();
  final _spotifyRepository = locator<SpotifyRepository>();
  final _navigatorService = locator<NavigationService>();

  Future<void> authorize() async {
    setBusy(true);
    try {
      bool response = await _spotifyRepository.authorize();
      if (response) {
        final existingUser = await _userRepository.checkUserExists();
        if (existingUser != null) {
          _navigatorService.clearStackAndShow(Routes.homeView);
        } else {
          _navigatorService.clearStackAndShow(Routes.userNameView);
        }
      } else {
        setError(true);
      }
    } catch (_) {
      setError(true);
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }
}
