import '../../models/user.dart';
import '../../util/notification_util.dart';

class InviteService {
  late String _userName;

  String get userName => _userName;

  Future<bool> inviteUser(User user) async {
    _userName = user.name;
    bool status = await NotificationUtil.inviteUser(user.id, userName);
    return status;
  }
}
