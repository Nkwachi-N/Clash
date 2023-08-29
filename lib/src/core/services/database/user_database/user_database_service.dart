import 'package:hive_flutter/hive_flutter.dart';
import '../../../constants/constants.dart';
import '../../../models/user.dart';

class UserDatabaseService {
  final _userKey = 'user';

  Box<User> get currentUserBox => Hive.box(PrefConstants.kHiveBox);

  Future saveCurrentUser(User user) async {
    try {
      Box<User> currentUserBox = Hive.box(PrefConstants.kHiveBox);

      /// This box should only contain one user
      await currentUserBox.clear();
      currentUserBox.add(user);
    } catch (_) {}
  }

  User? getCurrentUser() {
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
    await currentUserBox.clear();
  }
}
