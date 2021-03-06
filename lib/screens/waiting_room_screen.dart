import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/core/models/game.dart';
import 'package:clash_flutter/core/provider/user_provider.dart';
import 'package:clash_flutter/core/provider/game_provider.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:clash_flutter/widgets/room_card.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WaitingRoomScreen extends StatelessWidget {
  const WaitingRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameModel = context.watch<GameProvider>();
    final user = context.watch<UserProvider>().user;

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
                    Expanded(
                        child: AvatarImage(
                      avatar: 'assets/images/avatar_${user.avatar}.png',
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'VS',
                        style: textTheme.headline6?.copyWith(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    const Expanded(
                        child: AvatarImage(
                      avatar: '',
                    )),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        user.name.toUpperCase(),
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
                        child: Container(
                      height: 10,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 38.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF686868),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    )),
                  ],
                )
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            RoomCard(
                title: 'Clash category', subtitle: gameModel.category.name),
            ...[
              if (gameModel.category == Category.genre)
                RoomCard(title: 'Genre category', subtitle: gameModel.genre),
            ],
            RoomCard(
                title: 'Number of Rounds',
                subtitle: '${gameModel.rounds} rounds'),
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
  final String avatar;

  const AvatarImage({Key? key, required this.avatar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: avatar.isNotEmpty,
      replacement: Center(
        child: InkResponse(
          onTap: () {
            Navigator.of(context)
                .pushNamed(RouteGenerator.createClashRoomScreen);
          },
          child: Container(
              height: 140.0,
              width: 140.0,
              decoration: DottedDecoration(
                shape: Shape.circle,
                color: const Color(0xFF686868).withOpacity(0.8),
              ),
              child: const Icon(
                Icons.add,
                color: Color(0xFF686868),
              )),
        ),
      ),
      child: Stack(
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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(
                  avatar,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
