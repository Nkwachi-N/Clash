import 'dart:convert';
import 'package:clash_flutter/src/core/app/app.locator.dart';
import 'package:clash_flutter/src/core/models/category/category.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:clash_flutter/src/features/features.dart';
import 'package:clash_flutter/widgets/success_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
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

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final _userId = locator<UserDatabaseService>().getCurrentUser()?.id ?? '';

  String get thisUserUserName =>
      locator<UserDatabaseService>().getCurrentUser()?.name ?? '';

  Future<bool> inviteUser(
          {required String deviceToken, required String category}) =>
      _sendNotification(
        title: 'New Clash Invite',
        body: "$thisUserUserName is inviting you to clash.",
        deviceToken: deviceToken,
        data: {
          kUserNameKey: thisUserUserName,
          kTypeKey: NotificationType.gameInvite.name,
          kUserIdKey: _userId,
        },
      );

  Future<bool> acceptInvite(String deviceToken) => _sendNotification(
        deviceToken: deviceToken,
        title: "Accepted Invite.",
        body: "$thisUserUserName accepted your invite. Let's go!!!",
        data: {
          kTypeKey: NotificationType.inviteAccepted.name,
          kUserNameKey: thisUserUserName
        },
      );

  Future<bool> rejectInvite(
    String deviceToken,
  ) =>
      _sendNotification(
        body: "$thisUserUserName declined. E dey fear na why.",
        deviceToken: deviceToken,
        title: "Declined Invite.",
        data: {
          kTypeKey: NotificationType.inviteDeclined.name,
          kUserNameKey: thisUserUserName
        },
      );

  Future<bool> _sendNotification(
      {required String body,
      required String title,
      required String deviceToken,
      Map<String, dynamic>? data}) async {
    final Map<String, dynamic> rqBody = {
      "notification": {
        "body": body,
        "title": title,
      },
      "to": deviceToken,
      "data": data,
    };

    try {
      final response = await http.post(Uri.parse(ApiRoute.createNotification),
          body: jsonEncode(rqBody),
          headers: {
            'Authorization': 'Bearer $kFcmKey',
            'Content-Type': 'application/json'
          });

      return response.statusCode == 200 &&
          jsonDecode(response.body)['success'] >= 1;
    } catch (e) {
      return false;
    }
  }

  Future<void> requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleNotification(initialMessage.data);
    }

    FirebaseMessaging.onMessageOpenedApp
        .listen((e) => _handleNotification(e.data));

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleNotification(message.data);
    });
  }

  void _handleNotification(Map<String, dynamic> rawPayload) {
    final String opsUsername = rawPayload[kUserNameKey] ?? 'The Ops';
    final String? opsUserId = rawPayload[kUserIdKey];

    final String? notificationType = rawPayload[kTypeKey];
    if (notificationType == NotificationType.gameInvite.name &&
        opsUserId != null) {
      _receivedInvite(
        username: opsUsername,
        userId: opsUserId,
      );
    } else if (notificationType == NotificationType.inviteAccepted.name) {
      _acceptedInvite(opsUsername);
    } else if (notificationType == NotificationType.inviteDeclined.name) {
      _navigationService
          .navigateToView(DeclineInviteView(username: opsUsername));
    }
  }

  void _receivedInvite({required String username, required String userId}) {
    _navigationService.navigateToView(
      ReceivedInviteScreen(
        userName: username,
        userId: userId,
      ),
    );
  }

  void _acceptedInvite(String userName) {
    final category = _gameService.category;

    _navigationService.navigateToView(
      SuccessScreen(
        args: SuccessScreenArgs(
          title: '$userName accepted your invite',
          onTap: () {
            if (category is GenreCategory) {
              _navigationService.navigateTo(Routes.genreWaitingRoomView);
            }
          },
          subtitle: 'The stage is set.',
        ),
      ),
    );
  }
}
