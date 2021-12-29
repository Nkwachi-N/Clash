import 'package:clash_flutter/constants.dart';
import 'package:clash_flutter/widgets/mode_tile.dart';
import 'package:flutter/material.dart';

class HostModeScreen extends StatelessWidget {
  const HostModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: green200,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'How do you want to Clash?',
              style: textTheme.headline6,
            ),
            const SizedBox(
              height: 40.0,
            ),
            const ModeTile(
              title: 'Host',
              subtitle:
                  'Invite friends by their username or share your battle room code',
            ),
            const SizedBox(
              height: 16.0,
            ),
            const ModeTile(
              title: 'Join',
              subtitle:
                  'Accept invites from friends through your username or join by their battle room code',
            ),
          ],
        ),
      ),
    );
  }
}
