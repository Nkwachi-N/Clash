import 'package:clash_flutter/src/core/constants/snack_bar_type.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:clash_flutter/src/features/features.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../core/app/app.locator.dart';
import '../../../../../core/models/user.dart';

class CreateRoomViewModel extends BaseViewModel {
  final _snackBarService = locator<SnackbarService>();
  final _notificationService = locator<NotificationService>();

  final _firebaseService = locator<FireBaseService>();
  final _userDatabaseService = locator<UserDatabaseService>();
  final _navigationService = locator<NavigationService>();
  final controller = TextEditingController();

  // User get user => _userRepository.user;
   User? get user => _userDatabaseService.getCurrentUser();

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  bool _userNameIsValid = false;

  bool get userNameIsValid => _userNameIsValid;

  inviteUser() async {
    setBusy(true);
    final user = await _firebaseService.getUserByUserName(controller.text);

    if (user != null) {
      _notificationService.inviteUser(user.id).then((value) {
        if (value) {
          _navigationService.navigateToView(InviteSentView(username: user.name));
        } else {
          _snackBarService.showCustomSnackBar(
            message: 'Invite sending failed, please try again',
            variant: SnackBarType.error,
          );
        }
      });
    } else {
      _snackBarService.showCustomSnackBar(
        message: 'User does not exist',
        variant: SnackBarType.error,
        duration: const Duration(seconds: 3),
      );
    }

    setBusy(false);
  }

  String? validateUserName(String? value) {
    if (value != null && value.isEmpty) {
      return 'please enter your friend\'s username';
    } else if (value != null && value.length < 3) {
      return 'username must be at least 3 characters';
    }
    if (value == user?.name) {
      return 'You can\'t play a game with yourself.';
    }
    return null;
  }

  void onChanged(String? value) {
    if (value != null && value.length >= 3) {
      _userNameIsValid = _formKey.currentState?.validate() ?? false;
      notifyListeners();
    }
  }
}
