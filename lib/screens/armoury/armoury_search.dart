import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/core/models/track.dart';
import 'package:clash_flutter/core/provider/search_provider.dart';
import 'package:clash_flutter/core/response_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

extension PlayerUtil on AudioPlayer {


   String? getMusic() {
    final ProgressiveAudioSource? audioSource = this.audioSource as ProgressiveAudioSource?;

    return audioSource?.uri.toString();
  }
}

class ArmourySearch extends StatefulWidget {
  const ArmourySearch({Key? key}) : super(key: key);

  @override
  State<ArmourySearch> createState() => _ArmourySearchState();
}

class _ArmourySearchState extends State<ArmourySearch>
    with ResponseHandler, SingleTickerProviderStateMixin {
  late TextEditingController _textEditingController;
  late AnimationController _controller;
  late Animation<double> _fadeOutAnimation;
  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController();

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

    _textEditingController.addListener(() async {
      final value = _textEditingController.text;
      if (value.isNotEmpty) {
        //TODO:revert state and stop playing.
        if(player.playing) {
          player.stop();
        }

        final response = await context
            .read<SearchProvider>()
            .searchTracks(value, 'afrobeat');
        if(mounted) {
          handleResponse(context, response);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final searchModel = context.watch<SearchProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Armoury'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              style: textTheme.subtitle1?.copyWith(
                color: ClashColors.green200,
              ),
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Search for a song',
                prefixIcon: UnconstrainedBox(
                  child: SvgPicture.asset(
                    'assets/images/search.svg',
                    height: 20.0,
                    width: 20.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Expanded(
              child: Visibility(
                visible: !searchModel.searching,
                replacement: const Center(
                  child: SpinKitFadingFour(
                    color: ClashColors.green200,
                  ),
                ),
                child: ListView.builder(
                    itemCount: searchModel.tracks.length,
                    itemBuilder: (context, index) {
                      final track = searchModel.tracks[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            PlayWidget(
                              track: track,
                              animation: _controller,
                              player: player, pausePressed: () {
                                player.stop();
                                _revertState();
                            },
                              playPressed: ()async {
                              if (track.audioUrl != null) {

                                if(player.playing) {
                                  player.stop();
                                }

                                final duration =
                                await player.setAudioSource(
                                  ProgressiveAudioSource(
                                    Uri.parse(track.audioUrl!),
                                  ),
                                );

                                _controller.duration = duration;
                                player
                                    .play()
                                    .then((value) => _revertState());
                              }
                            },
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
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
                              onPressed: () async {


                              },
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
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
    cleanUp();
    super.dispose();
  }
}

class PlayWidget extends StatelessWidget {
  final Track track;
  final Animation<double> animation;
  final AudioPlayer player;
  final VoidCallback playPressed;
  final VoidCallback pausePressed;

  const PlayWidget({
    Key? key,
    required this.player,
    required this.track,
    required this.animation,
    required this.playPressed,
    required this.pausePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context,child){
        final playing = player.playing && player.getMusic() == track.audioUrl;
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
              visible: track.audioUrl != null,
              child: AnimatedCrossFade(
                firstChild: IconButton(
                  key: const ValueKey('play'),
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                    size: 35.0,
                  ),
                  onPressed: playPressed,
                ),
                secondChild: IconButton(
                  key: const ValueKey('pause'),
                  icon: const Icon(
                    Icons.stop_rounded,
                    size: 30.0,
                  ),
                  onPressed: pausePressed,
                ),
                crossFadeState:
                playing ? CrossFadeState.showSecond : CrossFadeState.showFirst,
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
            image: track.imageUrl,
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
        value: animation.value,
        color: ClashColors.green200,
        strokeWidth: 2.0,
      );
    } else {
      return const SizedBox();
    }
  }


}
