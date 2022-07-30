import 'package:clash_flutter/src/features/home/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../gen/assets.gen.dart';
import 'edit_profile_view_model.dart';

class EditProfileView extends ViewModelBuilderWidget<EditProfileViewModel> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, EditProfileViewModel viewModel, Widget? child) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 46.0,
              ),
              Text(
                'What would you like to edit?',
                style: textTheme.headline6,
              ),
              SizedBox(
                height: 48.h,
              ),
              ProfileTile(
                title: 'My Username',
                iconPath: Assets.images.inviteFriends,
                onTap: viewModel.navigateToUserNameView,
              ),
              SizedBox(
                height: 16.0,
              ),
              ProfileTile(
                title: 'My Avatar',
                iconPath: Assets.images.myAvatar,
                onTap: viewModel.navigateToAvatarView,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  EditProfileViewModel viewModelBuilder(BuildContext context) =>
      EditProfileViewModel();
}
