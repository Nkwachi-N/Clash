import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/src/features/home/profile/views/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/avatar_widget.dart';
import '../widgets/profile_tile.dart';

class ProfileView extends ViewModelBuilderWidget<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ProfileViewModel viewModel, Widget? child) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  'assets/images/profile-frame.svg',
                  width: 375.w,
                  height: 175.h,
                ),
                SizedBox(
                  height: 56.h,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ImanuelJnr',
                              style: textTheme.headline6,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'Joined December 2021',
                              style: textTheme.caption,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 48.h,
                        ),
                        ProfileTile(
                          title: 'Invite friends',
                          iconPath: Assets.images.inviteFriends,
                          onTap: viewModel.toInviteFriendsView,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        ProfileTile(
                          title: 'Share on social media',
                          iconPath: Assets.images.shareSocials,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        ProfileTile(
                          title: 'About Clash',
                          iconPath: Assets.images.aboutClash,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        ProfileTile(
                          title: 'Rate Us',
                          iconPath: Assets.images.rateUs,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Center(
                          child: Text(
                            'V 1.0.1',
                            style: textTheme.caption?.copyWith(
                              color: ClashColors.green200,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: 120.h,
              child: AvatarWidget(
                avatar: '',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}

