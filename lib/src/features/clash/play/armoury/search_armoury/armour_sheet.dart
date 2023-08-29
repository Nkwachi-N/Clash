import 'package:clash_flutter/widgets/play_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_flutter/spotify_flutter.dart';

import '../../../../../../colors.dart';

class ArmourSheet extends StatelessWidget {
  final List<Track> tracks;
  final GestureTapCallback? onRemoveTapped;
  final int rounds;
  final VoidCallback? onClashPressed;

  const ArmourSheet({
    Key? key,
    this.tracks = const [],
    this.onRemoveTapped,
    this.onClashPressed,
    required this.rounds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Selection',
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${tracks.length}/$rounds Ammo',
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: tracks.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final track = tracks[index];
                  return Row(
                    children: [
                      PlayIcon(
                        track: track,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                track.name,
                                style: textTheme.titleSmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                track.artists
                                        ?.map((e) => e.name)
                                        .toList()
                                        .join(',') ??
                                    '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.bodyMedium?.copyWith(
                                  color: ClashColors.grey900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 10.0,
                          ),
                          side: const BorderSide(width: 1, color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        label: const Text(
                          'Remove',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                        onPressed: onRemoveTapped,
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            TextButton(
              onPressed: onClashPressed,
              child: const Text('Clash'),
            ),
          ],
        ),
      ),
    );
  }
}
