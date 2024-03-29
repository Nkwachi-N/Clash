import 'package:clash_flutter/app.dart';
import 'package:clash_flutter/src/core/app/app.locator.dart';
import 'package:clash_flutter/src/core/constants/snack_bar_type.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupLocator();


  await locator<UserDatabaseService>().initializeDb();

  final snackBarService = locator<SnackbarService>();

  final snackBarConfig = SnackbarConfig(
    snackPosition: SnackPosition.TOP,
    snackStyle: SnackStyle.FLOATING,
    borderRadius: 16.0,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
    backgroundColor: Colors.red,
    messageColor: Colors.white,
    messageTextStyle: const TextStyle(
      fontSize: 12.0,
    )

  );

  snackBarService.registerCustomSnackbarConfig(
      variant: SnackBarType.error,
      config:snackBarConfig..backgroundColor = Colors.red..messageColor = Colors.white );

  snackBarService.registerCustomSnackbarConfig(
      variant: SnackBarType.message,
      config:snackBarConfig..backgroundColor = Colors.green..messageColor = Colors.white );


  runApp(
    const ClashApp(),
  );
}
