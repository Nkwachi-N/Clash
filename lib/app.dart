import 'package:clash_flutter/app_lifecycle/app_lifecycle.dart';
import 'package:clash_flutter/src/core/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:clash_flutter/utils/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:stacked_services/stacked_services.dart';

class ClashApp extends StatelessWidget {
  final String initialRoute;

  const ClashApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => KeyboardDismisser(
        child: AppLifecycleObserver(
          child: MaterialApp(
            title: 'Clash',
            debugShowCheckedModeBanner: false,
            theme: ClashTheme.darkTheme,
            navigatorKey: StackedService.navigatorKey,
            initialRoute: initialRoute,
            onGenerateRoute: StackedRouter().onGenerateRoute,
          ),
        ),
      ),
    );
  }
}
