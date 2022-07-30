import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class JoinRoomViewModel extends BaseViewModel{

  final controller = TextEditingController();

  int get otpLength => 6;
  final FocusNode _focusNode = FocusNode();
  FocusNode get focusNode => _focusNode;

  void onChanged(String value) {
    notifyListeners();
    if (value.length == otpLength) {
      focusNode.unfocus();
    }
  }
}