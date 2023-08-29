import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/src/features/clash/play/clash_room/views/clash_room_viewmodel.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:spotify_flutter/spotify_flutter.dart' as sp;
import 'package:stacked/stacked.dart';

const _kImageSize = 120.0;

class ClashRoomView extends StatelessWidget {
  const ClashRoomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ViewModelBuilder<ClashRoomViewModel>.reactive(
        viewModelBuilder: () => ClashRoomViewModel(),
        onModelReady: (viewModel) => viewModel.onReady(),
        builder: (context, viewModel, _) {
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
                    style: textTheme.headlineSmall,
                  )),
                  const SizedBox(
                    height: 64.0,
                  ),
                  Visibility(
                    visible: viewModel.currentTurn == viewModel.myRole,
                    child: Text(
                      'Your move, ${viewModel.isHost ? viewModel.hostName : viewModel.guestName} 👀',
                      style: textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 22.0,
                  ),
                  Expanded(
                    child: GameCard(
                      track: viewModel.game?.hostPlayed,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Expanded(
                    child: GameCard(
                      track: viewModel.game?.guestPlayed,
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
                        onPressed: () {
                          viewModel.addTrack();
                        },
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
        });
  }
}

class GameCard extends StatelessWidget {
  final sp.Track? track;

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
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                  child: Visibility(
                visible: track != null,
                replacement: Container(
                    height: _kImageSize,
                    width: _kImageSize,
                    decoration: DottedDecoration(
                      shape: Shape.circle,
                      color: ClashColors.grey200,
                    )),
                child: Container(
                  height: _kImageSize,
                  width: _kImageSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF272222),
                    image: DecorationImage(
                        image: NetworkImage(_getImageUrl(track))),
                  ),
                ),
              )),
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
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      track?.name ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleLarge,
                    ),
                  ),
                  const Spacer(),
                ],
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
                    track?.artists?.map((e) => e.name).toList().join(',') ?? '',
                    style: textTheme.titleMedium
                        ?.copyWith(color: ClashColors.grey900, fontSize: 14),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Text(
                      track?.album?.name ?? '',
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      style: textTheme.bodySmall
                          ?.copyWith(color: ClashColors.grey900, fontSize: 14),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

String _getImageUrl(sp.Track? track) {
  if (track == null) return '';
  return track.album != null && track.album!.images.isNotEmpty
      ? track.album?.images[0].url ?? ''
      : '';
}
