import 'package:clash_flutter/src/core/constants/snack_bar_type.dart';
import 'package:clash_flutter/src/core/repository/invite/invite_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../core/app/app.locator.dart';
import '../../../../../core/app/app.router.dart';
import '../../../../../core/models/user.dart';
import '../../../../../core/repository/repository.dart';

enum UserNameState { valid, invalid, idle }

class CreateRoomViewModel extends BaseViewModel {
  final _inviteService = locator<InviteService>();
  final _snackBarService = locator<SnackbarService>();

  final _userRepository = locator<UserRepository>();
  final _navigationService = locator<NavigationService>();
  final controller = TextEditingController();

  User get user => _userRepository.user;

  UserNameState _userNameState = UserNameState.idle;

  UserNameState get userNameState => _userNameState;

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  bool _userNameIsValid = false;

  bool get userNameIsValid => _userNameIsValid;

  inviteUser() async {
    setBusy(true);
    final user = await _userRepository.getUserByUserName(controller.text);

    if (user != null) {
      _inviteService.inviteUser(user).then((value) {
        if (value) {
          _navigationService.navigateTo(Routes.inviteSentView);
        } else {
          _snackBarService.showSnackbar(
              message: 'Invite sending failed, please try again');
        }
      });
    } else {
      _userNameIsValid = false;
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
    if (value == user.name) {
      return 'You can\'t play a game with yourself.';
    }
    return null;
  }

  void onChanged(String? value) {
    if (value != null && value.length >= 3) {
      print('validate');
      _userNameIsValid = _formKey.currentState?.validate() ?? false;
      notifyListeners();
    }
  }
}
