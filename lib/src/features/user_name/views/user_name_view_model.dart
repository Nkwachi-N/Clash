import 'package:clash_flutter/src/core/services/service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:clash_flutter/src/core/app/app.locator.dart';
import 'package:clash_flutter/src/core/models/user.dart';

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

  final _fireBaseService = locator<FireBaseService>();
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



  Future<void> userNameCheck(String userName) async {
    userNameProgress = UserNameState.loading;
    notifyListeners();

    User? result = await _fireBaseService.getUserByUserName(userName);

    if (result != null) {
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

  void next() {}
}
