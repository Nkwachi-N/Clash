import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/widgets/avatar_widget.dart';
import 'package:clash_flutter/widgets/room_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'genre_waiting_room_view_model.dart';

class GenreWaitingRoomView
    extends ViewModelBuilderWidget<GenreWaitingRoomViewModel> {
  const GenreWaitingRoomView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, GenreWaitingRoomViewModel viewModel, _) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: kToolbarHeight + 16.0,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: BackButton(
                color: ClashColors.green100,
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: AvatarWidget(
                        avatar: viewModel.hostAvatar,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'VS',
                        style: textTheme.titleLarge?.copyWith(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    Expanded(
                      child: AvatarWidget(
                        avatar: viewModel.guestAvatar,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        viewModel.hostName,
                        textAlign: TextAlign.center,
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'VS',
                        style: textTheme.titleLarge?.copyWith(
                          color: ClashColors.green100,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        viewModel.guestName,
                        textAlign: TextAlign.center,
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            const RoomCard(title: 'Clash category', subtitle: 'Genre'),
            RoomCard(title: 'Genre category', subtitle: viewModel.genre),
            RoomCard(
                title: 'Number of Rounds',
                subtitle: '${viewModel.rounds} rounds'),
            const Spacer(
              flex: 2,
            ),
            TextButton(
              onPressed: viewModel.setUpArmoury,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Set up Armoury',
                    style: textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }

  @override
  GenreWaitingRoomViewModel viewModelBuilder(BuildContext context) =>
      GenreWaitingRoomViewModel();
}
