import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../core/app/app.locator.dart';
import '../../../../../core/models/user.dart';
import '../../../../../core/repository/repository.dart';

class CreateRoomViewModel extends BaseViewModel{

  final _gameRepository = locator<GameRepository>();
  final _snackBarService = locator<SnackbarService>();
  final _userRepository = locator<UserRepository>();

  User get user => _userRepository.user;

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  bool userNameIsValid = true;

  inviteUser(String text) {

    //TODO: check if username exists
    _gameRepository.inviteUser(text).then((value){
      if(value){
        //TODO:navigate to invite sent screen
      }else{
       _snackBarService.showSnackbar(message: 'Invite sending failed, please try again');
      }
    });
  }

  String? validateUserName(String? value) {
    if (value != null && value.isEmpty) {
      userNameIsValid = false;
      notifyListeners();
      return 'please enter your friend\'s username';
    } else if (value != null && value.length < 3) {
      userNameIsValid = false;
      notifyListeners();
      return 'username must be at least 3 characters';

    }

    if (value == user.name) {
      userNameIsValid = false;
      notifyListeners();
      return 'You can\'t play a game with yourself.';
    }
    userNameIsValid = true;
    notifyListeners();
    return null;
  }

  void onChanged(String? value) {
    _formKey.currentState?.validate();
  }
}