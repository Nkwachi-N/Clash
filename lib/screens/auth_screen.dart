import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/core/repository/auth_repository.dart';
import 'package:clash_flutter/screens/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool loading = false;
  final html = '''
 <!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<p>
The navigation delegate is set to block navigation to the youtube website.
</p>
<ul>
<ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
<ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
</ul>
</body>
</html>
  ''';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/X42.png'),
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            Text(
              'CLASH',
              style: textTheme.headline2?.copyWith(
                color: green200,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                final repository = AuthRepository();
                repository.authorize();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.0,
                    child: Image.asset(
                      'assets/images/Spotify_Icon_White.png',
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Continue with Spotify',
                    style: textTheme.button,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Visibility(
                    visible: loading,
                    child: const SpinKitThreeBounce(
                      color: Colors.white,
                      size: 15.0,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            )
          ],
        ),
      ),
    );
  }
}
