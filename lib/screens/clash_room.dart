import 'package:flutter/material.dart';

class ClashRoomScreen extends StatefulWidget {
  const ClashRoomScreen({Key? key}) : super(key: key);

  @override
  _ClashRoomScreenState createState() => _ClashRoomScreenState();
}

class _ClashRoomScreenState extends State<ClashRoomScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: kToolbarHeight + 16.0,
            ),
            Center(child: Text('Clash Room',style: textTheme.headline5,)),
            const SizedBox(
              height: 64.0,
            ),
            Text('👀',style: textTheme.headline5)


          ],
        ),
      ),
    );
  }
}
