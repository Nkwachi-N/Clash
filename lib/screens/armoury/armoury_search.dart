import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/core/provider/audio_provider.dart';
import 'package:clash_flutter/core/provider/search_provider.dart';
import 'package:clash_flutter/widgets/play_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';


class ArmourySearch extends StatelessWidget {
  const ArmourySearch({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final searchModel = context.watch<SearchProvider>();
    final textEditingController = useTextEditingController();
    textEditingController.addListener(() {
      final value = textEditingController.text;
      if (value.isNotEmpty) {
        context.read<AudioProvider>().stopMusic();

        context
            .read<SearchProvider>()
            .searchTracks(value, 'afrobeat');
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Armoury'),
      ),
      floatingActionButton: Badge(
        badgeContent: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: const Text('6'),
        ),
        animationType: BadgeAnimationType.fade,
        padding: const EdgeInsets.all(2.0),
        elevation: 0,
        badgeColor: Theme.of(context).scaffoldBackgroundColor,
        child: FloatingActionButton(
          backgroundColor: ClashColors.green200,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
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
              controller: textEditingController,
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
                            PlayIcon(
                              track: track,
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
                              onPressed: () async {},
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

}

