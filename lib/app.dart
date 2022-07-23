import 'package:clash_flutter/src/core/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:clash_flutter/utils/theme.dart';
import 'package:stacked_services/stacked_services.dart';

class ClashApp extends StatelessWidget {


  const ClashApp({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clash',
      debugShowCheckedModeBanner: false,
      theme: ClashTheme.darkTheme,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
