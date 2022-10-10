import 'dart:convert';
import 'dart:developer';
import 'package:clash_flutter/src/core/app/app.locator.dart';
import 'package:clash_flutter/src/core/models/category/category.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:clash_flutter/src/features/features.dart';
import 'package:clash_flutter/widgets/success_screen.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../api/api_route.dart';
import '../../app/app.router.dart';
import '../../secret_keys.dart';

enum NotificationType {
  gameInvite,
  inviteAccepted,
  inviteDeclined,
}

const kUserNameKey = 'user_name';
const kUserIdKey = 'user_id';
const kTypeKey = 'type';
const gameIdKey = 'game_id';

class NotificationService {
  final _navigationService = locator<NavigationService>();
  final _gameService = locator<GameService>();

  final _userId = locator<UserDatabaseService>().getCurrentUser()?.id ?? '';

  String get username =>
      locator<UserDatabaseService>().getCurrentUser()?.name ?? '';

  Future<bool> inviteUser({required String userId,required String category}) async {
    final body = {
      "include_external_user_ids": [userId],
      "data": {
        kUserNameKey: username,
        kTypeKey: NotificationType.gameInvite.name,
        kUserIdKey: _userId,
      },
      "headings": {"en": "New Clash invite"},
      "contents": {"en": "$username is inviting you to clash."}
    };

    print(body);

    return await _sendNotification(body);
  }

  Future<bool> acceptInvite(String userId) async {
    final body = {
      "include_external_user_ids": [userId],
      "data": {
        kTypeKey: NotificationType.inviteAccepted.name,
        kUserNameKey: username
      },
      "headings": {"en": "Accepted Invite."},
      "contents": {"en": "$username accepted your invite. Let's go!!!"}
    };

    return await _sendNotification(body);
  }

  Future<bool> rejectInvite(
    String userId,
  ) async {
    final body = {
      "include_external_user_ids": [userId],
      "data": {
        kTypeKey: NotificationType.inviteDeclined.name,
        kUserNameKey: username
      },
      "headings": {"en": "Declined Invite."},
      "contents": {"en": "$username declined. E dey fear na why."}
    };

    return await _sendNotification(body);
  }

  Future<bool> _sendNotification(Map<String, dynamic> body) async {
    final postBody = {
      "app_id": oneSignalAppId,
      "channel_for_external_user_ids": "push",
      ...body
    };
    try {
      final response = await http.post(Uri.parse(ApiRoute.createNotification),
          body: jsonEncode(postBody),
          headers: {
            'Authorization': 'Bearer $oneSignalRestApiKey',
            'Content-Type': 'application/json'
          });

      final Map<String, dynamic> responseMap = jsonDecode(response.body);
      print('response is ');
      print(responseMap);

      //TODO: handle cancel.
      if (responseMap.containsKey('recipients')) {
        return responseMap['recipients'] != null;
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> cancelNotification(String notificationId) async {
    final url =
        'https://onesignal.com/api/v1/notifications/$notificationId?app_id=$oneSignalRestApiKey';
    try {
      final response = await http.delete(Uri.parse(url), headers: {
        'Authorization': 'Bearer $oneSignalRestApiKey',
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

  void setUserId(String? userId) {
    OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) async {
      PermissionStatus statuses = await Permission.notification.request();
      if (statuses.isDenied) {
        openAppSettings();
      }
    });
    if (userId != null) {
      OneSignal.shared.setExternalUserId(userId);
    }
  }

  void setupInteractedMessage() {
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      event.complete(null);
      print('RECEIVED NOTIFICATION');

      final rawPayload = event.notification.additionalData;

      if (rawPayload != null) {
        _handleNotification(rawPayload);
      }
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      final rawPayload = result.notification.additionalData;
      if (rawPayload != null) {
        _handleNotification(rawPayload);
      }
    });
  }

  void _handleNotification(Map<String, dynamic> rawPayload) {
    final String notificationType = rawPayload[kTypeKey];
    if (notificationType == NotificationType.gameInvite.name) {
      final userName = rawPayload[kUserNameKey];
      final userId = rawPayload[kUserIdKey];

      _navigationService.navigateToView(
        ReceivedInviteScreen(
          userName: userName,
          userId: userId,
        ),
      );

    } else if (notificationType == NotificationType.inviteAccepted.name) {
      final userName = rawPayload[kUserNameKey];
      final category = _gameService.category;

      _navigationService.navigateToView(
        SuccessScreen(
          args: SuccessScreenArgs(
            title: '$userName accepted your invite',
            onTap: () {
              if(category is GenreCategory) {
                _navigationService.navigateTo(Routes.genreWaitingRoomView);
              }

            },
            subtitle: 'The stage is set.',
          ),
        ),
      );
    } else if (notificationType == NotificationType.inviteDeclined.name) {
      final userName = rawPayload[kUserNameKey];
      //TODO: Remove game

      _navigationService.navigateToView(DeclineInviteView(username: userName));
    }
  }
}
