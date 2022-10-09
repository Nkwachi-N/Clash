import 'package:clash_flutter/app.dart';
import 'package:clash_flutter/src/core/app/app.locator.dart';
import 'package:clash_flutter/src/core/app/app.router.dart';
import 'package:clash_flutter/src/core/constants/constants.dart';
import 'package:clash_flutter/src/core/constants/snack_bar_type.dart';
import 'package:clash_flutter/src/core/models/user.dart';
import 'package:clash_flutter/src/core/secret_keys.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();

  setupLocator();

  Hive.registerAdapter(UserAdapter());
  await Hive.openBox(PrefConstants.kHiveBox);

  OneSignal.shared.setAppId(oneSignalAppId);



  final snackBarService = locator<SnackbarService>();

  final snackBarConfig = SnackbarConfig(
    // backgroundColor: Colors.red,
    // messageColor: Colors.white,
    snackPosition: SnackPosition.TOP,
    snackStyle: SnackStyle.FLOATING,
    borderRadius: 8.0,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
  );

  snackBarService.registerCustomSnackbarConfig(
      variant: SnackBarType.error,
      config:snackBarConfig..backgroundColor = Colors.red..messageColor = Colors.white );


  runApp(
    ClashApp(
    ),
  );
}
