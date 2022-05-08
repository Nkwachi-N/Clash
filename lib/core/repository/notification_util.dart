import 'dart:convert';

import 'package:clash_flutter/core/api_route.dart';
import 'package:clash_flutter/core/constants.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';


enum NotificationType{
  gameInvite,
}

const kUserNameKey = 'user_name';
const kTypeKey = 'type';
class NotificationUtil{


  static Future<bool> sendNotification(String userId,String userName) async {


    final body =
      {
        "app_id": Constants.oneSignalAppId,
        "include_external_user_ids": [userId],
        "channel_for_external_user_ids": "push",
        "data": {kUserNameKey: userName,kTypeKey : NotificationType.gameInvite.name},
        "headings": {"en": "New Clash invite"},
        "contents": {"en": "$userName is inviting you to clash."}
      };



    try{
      final res = await http.post(Uri.parse(ApiRoute.createNotification),body: jsonEncode(body),headers: {
        'Authorization' : 'Bearer ${Constants.oneSignalRestApiKey}',
        'Content-Type' : 'application/json'
      });
      print(res.body);
      return jsonDecode(res.body)['recipients'] == 1;
    }catch(e){
      return false;
    }

  }

  static void setUserId(String userId) {
    OneSignal.shared.setExternalUserId(userId);
  }

  static void setupInteractedMessage(BuildContext context)  {
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

  static void _handleNotification(Map<String,dynamic> rawPayload, BuildContext context) {
    if(rawPayload[kTypeKey] == NotificationType.gameInvite.name) {
      final userName = rawPayload[kUserNameKey];
      Navigator.of(context).pushNamed(
        RouteGenerator.receivedInviteScreen,
        arguments: userName,
      );
    }
  }
}