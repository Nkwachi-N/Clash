import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/gen/assets.gen.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

import '../../../../../core/models/track.dart';


const _kImageSize = 120.0;

class ClashRoomView extends StatelessWidget {
  const ClashRoomView({Key? key}) : super(key: key);

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
            Center(
                child: Text(
                  'Clash Room',
                  style: textTheme.headline5,
                )),
            const SizedBox(
              height: 64.0,
            ),
            Text(
              'Your move, Don Kwaz 👀',
              style: textTheme.headline6,
            ),
            const SizedBox(
              height: 22.0,
            ),
            const Expanded(child: GameCard(track: null)),
            const SizedBox(
              height: 16.0,
            ),
            const Expanded(
              child: GameCard(
                track: null,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton.extended(
                  backgroundColor: ClashColors.red,
                  onPressed: () {},
                  label: const Text(
                    'Surrender',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  icon: const Icon(
                    Icons.flag_outlined,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                FloatingActionButton(
                  heroTag: 'search_armoury',
                  onPressed: () {},
                  child: const Icon(Icons.add),
                )
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
          ],
        ),
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final Track? track;

  const GameCard({
    super.key,
    required this.track,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(
        16.0,
        28.0,
        16.0,
        16.0,
      ),
      decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4).withOpacity(0.06),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: const Color(0xFF323232),
            width: 1.0,
          )),
      child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Visibility(
                      visible: track != null,
                      replacement:Container(
                        height: _kImageSize,
                        width: _kImageSize,
                        decoration: DottedDecoration(
                          shape: Shape.circle,
                          color: ClashColors.grey200,
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF272222),
                          ),
                        ),
                      ),
                      child: Hero(
                        tag: track?.name ?? '',
                        child: Image.asset(
                          Assets.images.avatar1.path,
                          height: _kImageSize,
                          width: _kImageSize,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Visibility(
                  visible: track != null,
                  replacement: Container(
                    width: constraints.maxWidth * 0.35,
                    height: 10.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: ClashColors.grey200,
                    ),
                  ),
                  child: Text(
                    'Nice For What',
                    style: textTheme.headline6,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Visibility(
                  visible: track != null,
                  replacement: Container(
                    width: constraints.maxWidth * 0.25,
                    height: 10.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: ClashColors.grey200,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Drake',
                        style: textTheme.subtitle1?.copyWith(
                          color: ClashColors.grey900,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Drake',
                        style: textTheme.subtitle1?.copyWith(
                          color: ClashColors.grey900,
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
      ),
    );
  }
}
