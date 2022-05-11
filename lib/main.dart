import 'package:clash_flutter/core/provider/search_provider.dart';
import 'package:clash_flutter/core/provider/user_provider.dart';
import 'package:clash_flutter/core/provider/game_provider.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:clash_flutter/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constants.dart';
import 'core/models/user.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  await Hive.openBox(Constants.kHiveBox);
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString(Constants.kAccessToken);

  String initialRoute = RouteGenerator.authScreen;

  OneSignal.shared.setAppId(Constants.oneSignalAppId);

  if (accessToken != null) {
    final box = Hive.box(Constants.kHiveBox);
    final User? user = box.get('user');
    if (user != null) {
      initialRoute = RouteGenerator.homeScreen;
    } else {
      initialRoute = RouteGenerator.userNameScreen;
    }
  }
  runApp(
    MyApp(
      initialRoute: initialRoute,
    ),
  );
}

class MyApp extends StatefulWidget {
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()..initUser()),
        ChangeNotifierProvider(create: (context) => GameProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
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


