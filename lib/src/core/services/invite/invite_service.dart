import 'package:clash_flutter/src/core/app/app.locator.dart';
import 'package:clash_flutter/src/core/services/notification/notification_service.dart';

import '../../models/user.dart';

class InviteService {
  late String userName;

  final _notificationService = locator<NotificationService>();

  Future<bool> inviteUser(User user) async {
    userName = user.name;
    bool status = await _notificationService.inviteUser(user.id, userName);

    return status;
  }
}
