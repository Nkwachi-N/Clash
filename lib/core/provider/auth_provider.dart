
import 'package:flutter/cupertino.dart' show ChangeNotifier;

import '../repository/auth_repository.dart';

class AuthProvider  extends ChangeNotifier{
  final _repository = AuthRepository();

  bool storingUserName = false;
  bool storingAvatar = false;
  int? selectedAvatar;


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

  void changeAvatar(int index) {
    selectedAvatar = index;
    notifyListeners();
  }

  Future<bool> storeAvatar() async{
    storingAvatar = true;
    notifyListeners();

    bool status = await _repository.saveAvatar(selectedAvatar!);

    storingAvatar = false;
    notifyListeners();

    return status;
  }

}
