import 'package:clash_flutter/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InviteStateScreen extends StatefulWidget {
  const InviteStateScreen({Key? key}) : super(key: key);

  @override
  _InviteStateScreenState createState() => _InviteStateScreenState();
}

class _InviteStateScreenState extends State<InviteStateScreen> {
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
            Center(child: Image.asset('assets/images/success.png')),
            const Spacer(),
            Text(
              'Donkwaz accepted your invite',
              textAlign: TextAlign.center,
              style: textTheme.headline5?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'The stage is set',
              textAlign: TextAlign.center,
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w400,
                color: ClashColors.grey900,
                fontSize: 18.0,
              ),
            ),

            const Spacer(
              flex: 2,
            ),
            TextButton(
              onPressed: () {},
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
