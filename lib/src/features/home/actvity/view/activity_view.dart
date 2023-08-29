import 'package:clash_flutter/src/features/home/widgets/activity_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../gen/assets.gen.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Center(
              child: Text(
                'Activity',
                style: textTheme.titleLarge,
              ),
            ),
            SizedBox(
              height: 48.h,
            ),
            Row(
              children: [
                Expanded(
                  child: ActivityTile(
                    title: 'Number of wins',
                    imagePath: Assets.images.crown,
                    subtitle: '4',
                  ),
                ),
                SizedBox(
                  width: 9.w,
                ),
                Expanded(
                  child: ActivityTile(
                    title: 'Number of clashes',
                    imagePath: Assets.images.fightingGame,
                    subtitle: '4',
                  ),
                )
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            Row(
              children: [
                Expanded(
                  child: ActivityTile(
                    title: 'Most won category',
                    imagePath: Assets.images.crown,
                    subtitle: 'Afrobeats',
                    subtitleTextStyle: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 9.w,
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
