import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/core/provider/auth_provider.dart';
import 'package:clash_flutter/core/provider/game_provider.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()..initUser()),
        ChangeNotifierProvider(create: (context) => GameProvider()),

      ],
      child: MaterialApp(
        title: 'Clash',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: ClashColors.black200,
          textTheme: textTheme.copyWith(

              headline5: textTheme.headline5?.copyWith(
                color: Colors.white,
              ),
              button: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
                color: Colors.white,
              ),
              headline6: textTheme.headline6?.copyWith(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              )),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: ClashColors.green200,
            selectionColor: ClashColors.green200,
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
                    return ClashColors.grey700;
                  }
                  return ClashColors.green200; // Use the component's default.
                },
              ),
            ),
          ),
        ),
        // initialRoute: initialRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
