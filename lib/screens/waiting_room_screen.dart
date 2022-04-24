import 'package:clash_flutter/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaitingRoomScreen extends StatefulWidget {
  const WaitingRoomScreen({Key? key}) : super(key: key);

  @override
  _WaitingRoomScreenState createState() => _WaitingRoomScreenState();
}

class _WaitingRoomScreenState extends State<WaitingRoomScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: kToolbarHeight + 16.0,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: BackButton(
                color: ClashColors.green200,
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Expanded(child: AvatarImage()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'VS',
                        style: textTheme.headline6?.copyWith(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    const Expanded(child: AvatarImage()),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'IMANUELJNR',
                        textAlign: TextAlign.center,
                        style: textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'VS',
                        style: textTheme.headline6?.copyWith(
                          color: ClashColors.green200,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'DONKWAZ',
                        textAlign: TextAlign.center,
                        style: textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            const RoomCard(title: 'Clash category', subtitle: 'genre'),
            const RoomCard(title: 'Genre category', subtitle: 'Hip hop'),
            const RoomCard(title: 'Number of Rounds', subtitle: '5 rounds'),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  const AvatarImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 140.0,
          width: 140.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF434343).withOpacity(0.58),
          ),
        ),
        Container(
          height: 130.0,
          width: 130.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF686868).withOpacity(0.3),
          ),
        ),
        Container(
          height: 120.0,
          width: 120.0,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                    'assets/images/avatar_1.png',
                  ))),
        ),
      ],
    );
  }
}

class RoomCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const RoomCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 8.0,
        bottom: 8.0,
      ),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: ClashColors.grey500,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.subtitle2?.copyWith(
                    color: ClashColors.grey900,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  subtitle,
                  style: textTheme.subtitle1?.copyWith(
                    color: ClashColors.grey400,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
