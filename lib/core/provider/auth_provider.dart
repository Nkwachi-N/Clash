
import 'package:flutter/cupertino.dart' show ChangeNotifier;

import '../repository/auth_repository.dart';

class AuthProvider  extends ChangeNotifier{
  final _repository = AuthRepository();

  bool storingUserName = false;


  Future<bool> authorize() async {
    return await _repository.authorize();
  }

  Future<bool> storeUserName(String userName) async {
    storingUserName = true;
    notifyListeners();

    bool status = await _repository.storeUserName(userName);

    storingUserName = false;
    notifyListeners();

    return status;
  }

}
