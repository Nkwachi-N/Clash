import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';
import 'avatar_view_model.dart';

class AvatarView extends ViewModelBuilderWidget<AvatarViewModel> {
  const AvatarView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, AvatarViewModel viewModel,_) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: ClashColors.green200,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'What avatar best describes you?',
              style: textTheme.headline6,
            ),
            const SizedBox(
              height: 32.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              AvatarWidget(
                path: Assets.images.avatar1.path,
                selected:
                    viewModel.selectedAvatar == Assets.images.avatar1.path,
                onTap: () => viewModel.changeAvatar(Assets.images.avatar1.path),
              ),
              AvatarWidget(
                path: Assets.images.avatar2.path,
                selected:
                    viewModel.selectedAvatar == Assets.images.avatar2.path,
                onTap: () => viewModel.changeAvatar(Assets.images.avatar2.path),
              ),
              AvatarWidget(
                path: Assets.images.avatar3.path,
                selected:
                    viewModel.selectedAvatar == Assets.images.avatar3.path,
                onTap: () => viewModel.changeAvatar(Assets.images.avatar3.path),
              ),
            ]),
            const SizedBox(
              height: 32.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AvatarWidget(
                  path: Assets.images.avatar4.path,
                  selected:
                      viewModel.selectedAvatar == Assets.images.avatar4.path,
                  onTap: () =>
                      viewModel.changeAvatar(Assets.images.avatar4.path),
                ),
                AvatarWidget(
                  path: Assets.images.avatar5.path,
                  selected:
                      viewModel.selectedAvatar == Assets.images.avatar5.path,
                  onTap: () =>
                      viewModel.changeAvatar(Assets.images.avatar5.path),
                ),
                AvatarWidget(
                  path: Assets.images.avatar6.path,
                  selected:
                      viewModel.selectedAvatar == Assets.images.avatar6.path,
                  onTap: () =>
                      viewModel.changeAvatar(Assets.images.avatar6.path),
                ),
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AvatarWidget(
                  path: Assets.images.avatar7.path,
                  selected:
                      viewModel.selectedAvatar == Assets.images.avatar7.path,
                  onTap: () =>
                      viewModel.changeAvatar(Assets.images.avatar7.path),
                ),
                AvatarWidget(
                  path: Assets.images.avatar8.path,
                  selected:
                      viewModel.selectedAvatar == Assets.images.avatar8.path,
                  onTap: () =>
                      viewModel.changeAvatar(Assets.images.avatar8.path),
                ),
                AvatarWidget(
                  path: Assets.images.avatar9.path,
                  selected:
                      viewModel.selectedAvatar == Assets.images.avatar9.path,
                  onTap: () =>
                      viewModel.changeAvatar(Assets.images.avatar9.path),
                ),
              ],
            ),
            const Spacer(),
            TextButton(
              onPressed: () async {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Continue',
                    style: textTheme.button,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Visibility(
                    visible: viewModel.isBusy,
                    child: const SpinKitThreeBounce(
                      color: Colors.white,
                      size: 10.0,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 32.0,
            )
          ],
        ),
      ),
    );
  }

  @override
  AvatarViewModel viewModelBuilder(BuildContext context) => AvatarViewModel();
}

class AvatarWidget extends StatelessWidget {
  final bool selected;
  final String path;
  final VoidCallback onTap;

  const AvatarWidget({
    Key? key,
    this.selected = false,
    required this.path,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: selected ? Colors.green : Colors.transparent,
            width: 2.0,
          ),
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(
              path,
            ),
          ),
        ),
      ),
    );
  }
}
