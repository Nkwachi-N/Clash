import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/models/user.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:spotify_flutter/spotify_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthViewModel extends BaseViewModel {
  final _userDatabaseService = locator<UserDatabaseService>();
  final _firebaseService = locator<FireBaseService>();
  final _spotifyRepository = locator<SpotifyService>();
  final _storageService = locator<StorageService>();
  final _navigatorService = locator<NavigationService>();

  Future<void> authorize() async {
    setBusy(true);
    try {
      final response = await _spotifyRepository.authorize();
      if (response != null) {
        await _saveToken(response);
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

  Future<void> _saveUser(UserProfile userProfile) async {
    String? deviceToken = await FirebaseMessaging.instance.getToken();
    final user = User.fromJson(
      userProfile.toJson()..putIfAbsent('device_token', () => deviceToken),
    );
    _firebaseService.saveUser(user);
    _userDatabaseService.saveCurrentUser(user);
  }

  Future<void> _saveToken(GetTokenResponse response) async {
    if (response.accessToken == null || response.refreshToken == null) return;
    await _storageService.saveToken(
        accessToken: response.accessToken!,
        refreshToken: response.refreshToken!);
  }
}
