import '../../models/user.dart';
import '../../util/notification_util.dart';

class InviteService {
  late String userName;

  Future<bool> inviteUser(User user) async {
    userName = user.name;
    print(user.name + user.id);
    bool status = await NotificationUtil.inviteUser(user.id, userName);

    return status;
  }
}
