import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/core/constants.dart';
import 'package:clash_flutter/core/provider/search_provider.dart';
import 'package:clash_flutter/core/response_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ArmourySearch extends StatefulWidget  {
  const ArmourySearch({Key? key}) : super(key: key);

  @override
  State<ArmourySearch> createState() => _ArmourySearchState();
}

class _ArmourySearchState extends State<ArmourySearch> with ResponseHandler,SingleTickerProviderStateMixin {
  final player = AudioPlayer();

  int lastPlayedIndex = 0;
  late AnimationController _controller;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync:this ,duration: Duration(seconds: 30),);
    _controller.addListener(() {
      setState(() {
      print('animating');
      });
    });

    player.playerStateStream.listen((state) {
      if (state.playing){
        _controller.forward();
      }else if(state.processingState == ProcessingState.completed){
       _revertState(lastPlayedIndex);

      }
    });
  }
  List<bool> playing = List.filled(Constants.kSearchSize, false,growable: false);


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final searchModel = context.watch<SearchProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              style: textTheme.subtitle1?.copyWith(
                color: ClashColors.green200,
              ),
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
              onChanged: (value) async {
                final response =
                    await searchModel.searchTracks(value, 'afrobeat');

                handleResponse(context, response);
              },
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
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipOval(
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
                                Positioned.fill(
                                  child: AnimatedSwitcher(
                                    layoutBuilder:
                                        (currentChild, previousChildren) {
                                      return Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          ...[
                                            for (Widget child
                                                in previousChildren)
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
                                    child: _getProgressIndicator(playing[index]),
                                  ),
                                ),
                                AnimatedCrossFade(
                                    firstChild: IconButton(
                                      key: const ValueKey('play'),
                                      icon: const Icon(
                                        Icons.play_arrow_rounded,
                                        size: 35.0,
                                      ),
                                      onPressed: () async{
                                        playing[index] = !playing[index];
                                        lastPlayedIndex = index;
                                        final duration = await player.setUrl(track.audioUrl!);
                                        _controller.duration = duration;
                                        player.play();
                                      },
                                    ),
                                    secondChild: IconButton(
                                      key: const ValueKey('pause'),
                                      icon: const Icon(
                                        Icons.pause_rounded,
                                        size: 35.0,
                                      ),
                                      onPressed: () {
                                        player.stop();
                                        _revertState(index);
                                      },
                                    ),
                                    crossFadeState: playing[index] ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                                    duration: const Duration(milliseconds: 200))
                              ],
                            ),
                            const SizedBox(
                              width: 16.0,
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
                              onPressed: () {},
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

  Widget _getProgressIndicator(bool playing) {
    if (playing) {
      return CircularProgressIndicator(
        value: _controller.value,
        color: ClashColors.green200,
        strokeWidth: 2.0,
      );
    } else {
      return const SizedBox();
    }
  }

  void _revertState(int lastPlayedIndex) {
    playing[lastPlayedIndex] = false;
    _controller.reset();
  }
}
