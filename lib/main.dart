import 'package:clash_flutter/constants.dart';
import 'package:clash_flutter/screens/create_clash_room.dart';
import 'package:clash_flutter/screens/host_mode_screen.dart';
import 'package:clash_flutter/screens/join_clash_room.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: black200,
        textTheme: textTheme.copyWith(
          button: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18.0,
            color: Colors.white,
          ),
          headline6: textTheme.headline6?.copyWith(
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          )
        ),
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
      home: const JoinClashRoom()
    );
  }
}

