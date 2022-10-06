import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/models/user.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:spotify_flutter/spotify_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthViewModel extends BaseViewModel {
  final _userDatabaseService = locator<UserDatabaseService>();
  final _firebaseService = locator<FireBaseService>();
  final _spotifyRepository = locator<SpotifyService>();
  final _navigatorService = locator<NavigationService>();

  Future<void> authorize() async {
    setBusy(true);
    try {
      bool response = await _spotifyRepository.authorize();
      if (response) {
        final getCurrentUserResponse = await _spotifyRepository.getUser();
        if (getCurrentUserResponse != null) {
          _saveUser(getCurrentUserResponse);
          _navigatorService.clearStackAndShow(Routes.homeView);
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

  void _saveUser(GetCurrentUserProfileResponse getCurrentUserResponse) {
    final user = User.fromJson(getCurrentUserResponse.toJson());
    _firebaseService.saveUser(user);
    _userDatabaseService.saveUser(user);

  }
}
