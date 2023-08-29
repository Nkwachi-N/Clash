import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClashTheme {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ClashColors.black200,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ClashColors.green100,
      foregroundColor: Colors.white,
    ),
    textTheme: Typography.material2018()
        .white
        .copyWith(
            labelLarge: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
            ),
            titleLarge: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.normal,
            ),
            headlineSmall: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
            titleSmall: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: Colors.white,
            ),
            titleMedium: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ))
        .apply(
          fontFamily: FontFamily.clashDisplay,
        ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ClashColors.green100,
      selectionColor: ClashColors.green100,
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: ClashColors.green100)),
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
            return ClashColors.green100; // Use the component's default.
          },
        ),
      ),
    ),
  );
}
