import 'package:clash_flutter/colors.dart';
import 'package:flutter/material.dart';

class SuccessScreenArgs {
  String title;
  String subtitle;
  final GestureTapCallback onTap;

  SuccessScreenArgs({
    required this.title,
    required this.onTap,
    required this.subtitle,
  });
}

class SuccessScreen extends StatelessWidget {
  final SuccessScreenArgs args;

  const SuccessScreen({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Flexible(child: Center(child: Image.asset('assets/images/success.png'))),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                args.title,
                textAlign: TextAlign.center,
                style: textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              args.subtitle,
              textAlign: TextAlign.center,
              style: textTheme.headline6?.copyWith(
                color: ClashColors.grey900,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            TextButton(
              onPressed:args.onTap,
              child: Text('Let\'s go',
                  style: textTheme.button?.copyWith(
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              height: 32.0,
            )
          ],
        ),
      ),
    );
  }
}
