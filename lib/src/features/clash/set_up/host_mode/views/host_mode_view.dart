import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/widgets/mode_tile.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'host_mode_view_model.dart';

class HostModeView extends ViewModelBuilderWidget<HostModeViewModel> {
  const HostModeView({Key? key}) : super(key: key);


  @override
  Widget builder(BuildContext context, HostModeViewModel viewModel, Widget? child) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: ClashColors.green100,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'How do you want to Clash?',
              style: textTheme.headline6,
            ),
            const SizedBox(
              height: 40.0,
            ),
            ModeTile(
              onTap: viewModel.navigateToCategoryView,
              title: 'Host',
              subtitle:
              'Invite friends by their username or share your battle room code',
            ),
            const SizedBox(
              height: 20.0,
            ),
            ModeTile(
              onTap: viewModel.navigateToJoinClashRoomView,
              title: 'Join',
              // onTap: () => Navigator.of(context).pushNamed(RouteGenerator.joinClashRoomScreen),
              subtitle:
              'Accept invites from friends through your username or join by their battle room code',
            ),
          ],
        ),
      ),
    );
  }

  @override
  HostModeViewModel viewModelBuilder(BuildContext context) => HostModeViewModel();
}
