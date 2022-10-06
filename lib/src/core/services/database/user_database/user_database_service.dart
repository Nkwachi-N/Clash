import 'package:hive/hive.dart';

import '../../../constants/constants.dart';
import '../../../models/user.dart';

class UserDatabaseService {

  Future<bool> saveUser(User user) async {
    bool status = false;
    try {
      final box = Hive.box(PrefConstants.kHiveBox);
      box.put('user', user);
      status = true;
    } catch (e) {
      status = false;
    }
    return status;
  }






}