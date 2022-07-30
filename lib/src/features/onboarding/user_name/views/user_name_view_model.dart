import 'package:clash_flutter/src/core/repository/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../core/app/app.locator.dart';
import '../../../../core/app/app.router.dart';
import '../../../../core/models/user.dart';

enum UserNameState {
  idle,
  loading,
  exists,
  notFound,
}

class UserNameViewModel extends BaseViewModel {
  bool storingUserName = false;
  bool storingAvatar = false;
  bool authorizing = false;
  String? selectedAvatar;

  UserNameState userNameProgress = UserNameState.idle;

  final controller = TextEditingController();

  late User user;

  final _userRepository = locator<UserRepository>();
  final _navigatorService = locator<NavigationService>();
  final _snackBarService = locator<SnackbarService>();
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  String? validateField(String? value) {
    if (value != null && value.isEmpty) {
      return 'please enter your username';
    } else if (value != null && value.length < 3) {
      return 'username must be at least 3 characters';
    }
    if (userNameProgress == UserNameState.exists) {
      return 'Username is not available';
    }
    return null;
  }

  void fieldChanged(value) async {
    if (value.length >= 3) {
      await userNameCheck(value);
      _formKey.currentState!.validate();
    } else {
      resetUserNameState();
    }
  }

  void saveUserName() async {
    if (_formKey.currentState!.validate()) {
      bool status = await storeUserName(controller.text);

      if (status) {
        _navigatorService.navigateTo(Routes.avatarView);
      } else {
        _snackBarService.showSnackbar(
          message: 'Something went wrong, please try again',
        );
      }
    }
  }

  Future<bool> storeUserName(String userName) async {
    storingUserName = true;
    notifyListeners();

    bool status = await _userRepository.storeUserName(userName);

    storingUserName = false;
    notifyListeners();

    return status;
  }

  Future<void> userNameCheck(String userName) async {
    userNameProgress = UserNameState.loading;
    notifyListeners();

    bool result = await _userRepository.usernameCheck(userName);

    if (result) {
      userNameProgress = UserNameState.notFound;
    } else {
      userNameProgress = UserNameState.exists;
    }

    notifyListeners();
  }

  void resetUserNameState() {
    userNameProgress = UserNameState.idle;
    notifyListeners();
  }
}
