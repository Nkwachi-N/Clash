import 'package:clash_flutter/app.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:clash_flutter/src/core/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  await Hive.openBox(Constants.kHiveBox);
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString(Constants.kAccessToken);

  String initialRoute = RouteGenerator.authScreen;

  OneSignal.shared.setAppId(Constants.oneSignalAppId);

  if (accessToken != null) {
    final box = Hive.box(Constants.kHiveBox);
    final User? user = box.get('user');
    if (user != null) {
      initialRoute = RouteGenerator.homeScreen;
    } else {
      initialRoute = RouteGenerator.userNameScreen;
    }
  }

  configureDependencies();
  runApp(
    ClashApp(
      initialRoute: initialRoute,
    ),
  );
}


