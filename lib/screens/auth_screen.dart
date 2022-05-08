import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/core/constants.dart';
import 'package:clash_flutter/core/models/http_response.dart';
import 'package:clash_flutter/core/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/X42.png'),
            fit: BoxFit.fill
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            Text(
              'CLASH',
              style: textTheme.headline2?.copyWith(
                color: ClashColors.green200,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () => authorize(context),
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
                  Consumer<UserProvider>(

                    builder: (context, model,child) {
                      return Visibility(
                        visible: model.authorizing,
                        child: const SpinKitThreeBounce(
                          color: Colors.white,
                          size: Constants.kButtonLoaderSize,
                        ),
                      );
                    }
                  )

                ],
              ),
            ),
            const SizedBox(
              height: 32.0,
            )
          ],
        ),
      ),
    );
  }

  Future<void> authorize(BuildContext context) async{
    final result = await context.read<UserProvider>().authorize();
    if(result.responseStatus == ResponseStatus.success) {
      Navigator.of(context).pushReplacementNamed(result.data!);
    }else{
      //TODO:Show unable to login with flushbar.
    }
  }
}

