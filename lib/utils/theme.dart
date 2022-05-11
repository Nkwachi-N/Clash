import 'package:clash_flutter/colors.dart';
import 'package:flutter/material.dart';

class ClashTheme{
  static final darkTheme  = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ClashColors.black200,
    textTheme: Typography.material2018().white.copyWith(
      button: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18.0,
      ),
      headline6: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
      ),

    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ClashColors.green200,
      selectionColor: ClashColors.green200,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ClashColors.green200
      )
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ClashColors.grey500,
      hintStyle: const TextStyle(
        color: ClashColors.grey900,
        fontSize: 16.0,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(17.0),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return ClashColors.grey700;
            }
            return ClashColors.green200; // Use the component's default.
          },
        ),
      ),
    ),
  );
}