import 'dart:convert';

import 'package:clash_flutter/core/api_route.dart';
import 'package:clash_flutter/core/credentials.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:clash_flutter/widgets/success_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';

enum NotificationType {
  gameInvite,
  inviteAccepted,
  inviteDeclined,
}

const kUserNameKey = 'user_name';
const kTypeKey = 'type';

class NotificationUtil {
  static Future<bool> inviteUser(String userId, String userName) async {
    final body = {
      "include_external_user_ids": [userId],
      "data": {
        kUserNameKey: userName,
        kTypeKey: NotificationType.gameInvite.name
      },
      "headings": {"en": "New Clash invite"},
      "contents": {"en": "$userName is inviting you to clash."}
    };

    return await _sendNotification(body);
  }

  static Future<bool> acceptInvite(String userId, String userName) async {
    final body = {
      "include_external_user_ids": [userId],
      "data": {
        kTypeKey: NotificationType.inviteAccepted.name,
        kUserNameKey: userName
      },
      "headings": {"en": "Accepted Invite."},
      "contents": {"en": "$userName accepted your invite. Let's go!!!"}
    };

    return await _sendNotification(body);
  }

  static Future<bool> rejectInvite(String userId, String userName) async {
    final body = {
      "include_external_user_ids": [userId],
      "data": {
        kTypeKey: NotificationType.inviteDeclined.name,
        kUserNameKey: userName
      },
      "headings": {"en": "Declined Invite."},
      "contents": {"en": "$userName declined. E dey fear na why."}
    };

    return await _sendNotification(body);
  }

  static Future<bool> _sendNotification(Map<String, dynamic> body) async {
    final postBody = {
      "app_id": Constants.oneSignalAppId,
      "channel_for_external_user_ids": "push",
      ...body
    };
    try {
      final response = await http.post(Uri.parse(ApiRoute.createNotification),
          body: jsonEncode(postBody),
          headers: {
            'Authorization': 'Bearer ${Constants.oneSignalRestApiKey}',
            'Content-Type': 'application/json'
          });

      final Map<String, dynamic> responseMap = jsonDecode(response.body);

      //TODO: handle cancel.
      if (responseMap.containsKey('recipients')) {
        return responseMap['recipients'] == 1;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> cancelNotification(String notificationId) async {
    final url =
        'https://onesignal.com/api/v1/notifications/$notificationId?app_id=${Constants.oneSignalRestApiKey}';
    try {
      final response = await http.delete(Uri.parse(url), headers: {
        'Authorization': 'Bearer ${Constants.oneSignalRestApiKey}',
      });
      final Map<String, dynamic> responseMap = jsonDecode(response.body);

      if (responseMap.containsKey('success')) {
        return responseMap['success'];
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  static void setUserId(String userId) {
    OneSignal.shared.setExternalUserId(userId);
  }

  static void setupInteractedMessage(BuildContext context) {
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      event.complete(null);

      final rawPayload = event.notification.additionalData;

      if (rawPayload != null) {
        _handleNotification(rawPayload, context);
      }
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      final rawPayload = result.notification.additionalData;
      if (rawPayload != null) {
        _handleNotification(rawPayload, context);
      }
    });
  }

  static void _handleNotification(
      Map<String, dynamic> rawPayload, BuildContext context) {
    final String notificationType = rawPayload[kTypeKey];
    if (notificationType == NotificationType.gameInvite.name) {
      final userName = rawPayload[kUserNameKey];
      Navigator.of(context).pushNamed(
        RouteGenerator.receivedInviteScreen,
        arguments: userName,
      );
    } else if (notificationType == NotificationType.inviteAccepted.name) {
      final userName = rawPayload[kUserNameKey];
      Navigator.of(context).pushNamed(
        RouteGenerator.successScreen,
        arguments: SuccessScreenArgs(
          title: '$userName accepted your invite',
          onTap: () {},
          subtitle: 'The stage is set.',
        ),
      );
    } else if (notificationType == NotificationType.inviteDeclined.name) {
      final userName = rawPayload[kUserNameKey];
      Navigator.of(context).pushNamed(
        RouteGenerator.inviteDeclinedScreen,
        arguments: userName,
      );
    }
  }
}
