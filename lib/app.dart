import 'package:flutter/material.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:clash_flutter/utils/theme.dart';


class ClashApp extends StatelessWidget {
  final String initialRoute;

  const ClashApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clash',
        debugShowCheckedModeBanner: false,
        theme: ClashTheme.darkTheme,
        initialRoute: initialRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
      );
  }
}