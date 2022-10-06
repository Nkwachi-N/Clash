import 'package:hive_flutter/hive_flutter.dart';
import '../../../constants/constants.dart';
import '../../../models/user.dart';

class UserDatabaseService {

  final _userKey = 'user';

  Future saveCurrentUser(User user) async {
    try {
      Box<User> currentUserBox = Hive.box(PrefConstants.kHiveBox);

      /// This box should only contain one user
      await currentUserBox.clear();
      currentUserBox.add(user);
    } catch (_) {}
  }


  User? getCurrentUser() {
    Box<User> currentUserBox = Hive.box(PrefConstants.kHiveBox);
    return currentUserBox.values.isNotEmpty
        ? currentUserBox.values.first
        : null;
  }

  Future initializeDb() async {
    await Hive.initFlutter();
    Hive.registerAdapter<User>(UserAdapter());
    await Hive.openBox<User>(PrefConstants.kHiveBox);

  }

  // To be used when a different user tries to login on a new device
  Future nukeDb() async {
   /* Box<NubianUser> currentUserBox = Hive.box(HiveBoxName.currentUserBoxName);
    Box<EncryptedPassword> encryptedPasswordBox = Hive.box(HiveBoxName.encryptedPasswordBoxName);
    Box<LocalAccount> accountBox = Hive.box(HiveBoxName.accountsBoxName);
    await encryptedPasswordBox.clear();
    await currentUserBox.clear();
    await accountBox.clear();*/
  }






}