import 'package:clash_flutter/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../core/provider/game_provider.dart';
import '../widgets/gradient_card.dart';

class RoundsScreen extends StatelessWidget {
  const RoundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final model = context.watch<GameProvider>();

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: ClashColors.green200,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 32.0,
            ),
            Text(
              'How do you want to Clash?',
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Choose how you’ll be playing with your friends',
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Text(
              'Choose number of rounds',
              style: textTheme.headline5?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              flex: 2,
              child:Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap:() => model.selectRounds(5),
                      child: GradientCard(
                        colors: const [
                          Color(0xFF38F4BD),
                          Color(0xFF41EC8B),
                        ],
                        text: '5 rounds',
                        selected: model.rounds == 5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => model.selectRounds(10),
                      child: GradientCard(
                        colors: const [
                          Color(0xFFF3A469),
                          Color(0xFF6659AD),
                        ],
                        text: '10 rounds',
                        selected: model.rounds == 10,
                      ),
                    ),
                  ),
                ],
              )
            ),
            const Spacer(
              flex: 3,
            ),
            TextButton(
              onPressed: () => model.rounds != null ? clash(context) : null,
              child: Text(
                'Continue',
                style: textTheme.button,
              ),
            ),
            const SizedBox(
              height: 16.0,
            )
          ],
        ),
      ),
    ));
  }

  void clash (BuildContext context) {
    Navigator.of(context).pushNamed(RouteGenerator.waitingRoomScreen);
  }


}
