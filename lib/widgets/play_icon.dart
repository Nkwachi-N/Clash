import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/src/core/app/index.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_flutter/spotify_flutter.dart';
import 'package:transparent_image/transparent_image.dart';
import '../src/core/services/audio/audio_service.dart';

class PlayIcon extends StatefulWidget {
  final Track track;

  const PlayIcon({
    Key? key,
    required this.track,
  }) : super(key: key);

  @override
  State<PlayIcon> createState() => _PlayIconState();
}

class _PlayIconState extends State<PlayIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeOutAnimation;


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

    //TODO:fix
    final audioProvider = locator<AudioService>();

    final player = audioProvider.player;

    player.playerStateStream.listen((state) {
      if (state.playing && audioProvider.playing(widget.track.previewUrl) ) {
        _controller.forward();
      }
    });
    _controller.addListener(() {
      player.setVolume(_fadeOutAnimation.value);
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _revertState() {
    if (mounted) {
      _controller.stop();
      _controller.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final audioProvider = locator<AudioService>();

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
      final playing = audioProvider.playing(widget.track.previewUrl);

        return Stack(
          alignment: Alignment.center,
          children: [
            child!,
            Positioned.fill(
              child: AnimatedSwitcher(
                layoutBuilder: (currentChild, previousChildren) {
                  return Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      ...[
                        for (Widget child in previousChildren)
                          Positioned.fill(child: child)
                      ],
                      if (currentChild != null)
                        Positioned.fill(
                          child: currentChild,
                        ),
                    ],
                  );
                },
                duration: const Duration(milliseconds: 500),
                child: _getProgressIndicator(playing),
              ),
            ),
            Visibility(
              visible: widget.track.previewUrl != null,
              child: AnimatedCrossFade(
                firstChild: IconButton(
                  key: const ValueKey('play'),
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                    size: 35.0,
                  ),
                  onPressed: () async {
                    final player = audioProvider.player;

                    final audioUrl = widget.track.previewUrl;
                    if (audioUrl != null) {
                      if (player.playing) {
                        player.stop();
                        _revertState();
                      }

                     final duration = await player.setAudioSource(
                        ProgressiveAudioSource(
                          Uri.parse(audioUrl),
                        ),
                      );

                      _controller.duration = duration;

                      player.play().then((value) => {
                        _revertState(),
                        audioProvider.stopMusic()

                      });
                    }

                  }
                ),
                secondChild: IconButton(
                  key: const ValueKey('pause'),
                  icon: const Icon(
                    Icons.stop_rounded,
                    size: 30.0,
                  ),
                  onPressed: (){
                    audioProvider.stopMusic();
                    _revertState();
                  },
                ),
                crossFadeState: playing
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 200),
              ),
            ),
          ],
        );
      },
      child: ClipOval(
        child: Opacity(
          opacity: 0.5,
          child: FadeInImage.memoryNetwork(
            image: _getImageUrl(),
            height: 60.0,
            width: 60.0,
            placeholder: kTransparentImage,
          ),
        ),
      ),
    );
  }

  Widget _getProgressIndicator(bool playing) {
    if (playing) {
      return CircularProgressIndicator(
        value: _controller.value,
        color: ClashColors.green100,
        strokeWidth: 2.0,
      );
    } else {
      return const SizedBox();
    }
  }

  _getImageUrl() {
    return widget.track.album != null && widget.track.album!.images.isNotEmpty ? widget.track.album?.images[0].url ?? '' : '';
  }
}
