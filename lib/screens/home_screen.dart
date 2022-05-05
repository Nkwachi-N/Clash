import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../routes/route_generator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(22.0),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.07),
            borderRadius: BorderRadius.circular(40.0),
            border: Border.all(
              color: const Color(0xFF323232),
              width: 1.0,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/images/home.svg',
              color: IconTheme.of(context).color,
              height: 25.0,
              width: 25.0,
            ),
            const SizedBox(
              width: 46.0,
            ),
            SvgPicture.asset(
              'assets/images/stat.svg',
              color: IconTheme.of(context).color,
              height: 25.0,
              width: 25.0,
            ),
            const SizedBox(
              width: 46.0,
            ),
            SvgPicture.asset(
              'assets/images/profile.svg',
              color: IconTheme.of(context).color,
              height: 30.0,
              width: 30.0,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
            child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(RouteGenerator.receivedInviteScreen,arguments: 'Don Kwaz');
          },
          child: const Text('Play', ),
        )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setupInteractedMessage();
  }

  Future<void> setupInteractedMessage() async {
    OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
      // Will be called whenever a notification is received in foreground
      // Display Notification, pass null param for not displaying the notification

      event.complete(null);
      try{
        Navigator.of(context).pushNamed(RouteGenerator.receivedInviteScreen,arguments:'userName' );
      }catch(e){
        print('exception caught');
        print(e);
      }

    });

    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // Will be called whenever a notification is opened/button pressed.
      print('notification opened');
      print(result);
      try{
        Navigator.of(context).pushNamed(RouteGenerator.receivedInviteScreen,arguments:'userName' );
      }catch(e){
        print('exception caught');
        print(e);
      }
    });



    OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      // Will be called whenever the subscription changes
      // (ie. user gets registered with OneSignal and gets a user ID)
    });


  }
}
