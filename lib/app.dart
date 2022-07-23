import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:clash_flutter/utils/theme.dart';


class ClashApp extends StatelessWidget {
  final String initialRoute;

  const ClashApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          lazy: false,
          create: (context) => SpotifyRepository(),
        ),
        Provider(
          create: (context) => UserRepository(),
        ),
        Provider(
          create: (context) => GameRepository(),
        ),
        ChangeNotifierProvider(create: (context) => UserProvider()..initUser()),
        ChangeNotifierProvider<GameProvider>(
          create: (context) => GameProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider()..initUser(),
          lazy: false,
        ),
        ChangeNotifierProvider<SearchProvider>(
          create: (context) => SearchProvider(),
        ),
        Provider(
          create: (context) => AudioProvider(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Clash',
        debugShowCheckedModeBanner: false,
        theme: ClashTheme.darkTheme,
        initialRoute: widget.initialRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}