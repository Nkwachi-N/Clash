import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/core/models/track.dart';
import 'package:clash_flutter/screens/armoury/armoury_search.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicTile extends StatefulWidget {
  final Track track;

  const MusicTile({
    Key? key,
    required this.track,
  }) : super(key: key);

  @override
  _MusicTileState createState() => _MusicTileState();
}

class _MusicTileState extends State<MusicTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeOutAnimation;
  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );

    _fadeOutAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.75, 1.0),
    ));

    player.playerStateStream.listen((state) {
      if (state.playing) {
        _controller.forward();
      }
    });
    _controller.addListener(() {
      player.setVolume(_fadeOutAnimation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final track = widget.track;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          PlayWidget(
            track: track,
            animation: _controller,
            player: player,
            pausePressed: () {
              player.stop();
              _revertState();
            },
            playPressed: () async {
              if (track.audioUrl != null) {
                if (player.playing) {
                  player.stop();
                }

                final duration = await player.setAudioSource(
                  ProgressiveAudioSource(
                    Uri.parse(track.audioUrl!),
                  ),
                );

                _controller.duration = duration;
                player.play().then((value) => _revertState());
              }
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    track.name,
                    style: textTheme.subtitle2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    track.artists.join(', '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyText2?.copyWith(
                      color: ClashColors.grey900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
              vertical: 10.0,
            )),
            label: const Text(
              'Add',
              style: TextStyle(fontSize: 14.0),
            ),
            icon: const Icon(Icons.add, size: 20),
            onPressed: () async {},
          ),
        ],
      ),
    );
  }

  void _revertState() {
    if (mounted) {
      _controller.stop();
      _controller.reset();
    }
  }

  void cleanUp() async {
    _controller.dispose();
    if (player.playing) {
      await player.stop();
    }
    player.dispose();
  }

  @override
  void dispose() {
    print('disposed');
    cleanUp();
    super.dispose();
  }
}
