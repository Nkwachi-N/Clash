import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/core/provider/auth_provider.dart';
import 'package:clash_flutter/core/provider/game_provider.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

class MyApp extends StatefulWidget {
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'invite') {
      //TODO:Navigate to invite screen.
    }
  }

  @override
  void initState() {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
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
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(17.0),
              ),

              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              )),
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
        ),
        initialRoute: widget.initialRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
