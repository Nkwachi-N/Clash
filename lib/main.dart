import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/core/provider/auth_provider.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
      providers: [
        Provider(create:(context) => AuthProvider())
      ],
      child: MaterialApp(
        title: 'Clash',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: black200,
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
            )
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: green200,
            selectionColor: green200,
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
        initialRoute: RouteGenerator.authScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

