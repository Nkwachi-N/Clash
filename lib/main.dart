import 'package:clash_flutter/constants.dart';
import 'package:clash_flutter/screens/user_name_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: black200,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(16.0),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return grey700;
                }
                return green200; // Use the component's default.
              },
            ),
          ),
        ),

      ),
      home: const UserNameScreen()
    );
  }
}

