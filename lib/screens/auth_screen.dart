import 'package:clash_flutter/colors.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
            image: AssetImage('assets/images/X-42.png'),
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            Text(
              'CLASH',
              style: textTheme.headline4?.copyWith(
                color: green200,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.asset(
                      'assets/Spotify_Icon_White.png',
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'Continue with Spotify',
                    style: textTheme.button,
                  ),
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
