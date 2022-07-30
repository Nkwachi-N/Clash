import 'package:clash_flutter/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../features.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  height: 66.h,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Edit Profile',
                                style: textTheme.caption,
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: ClashColors.green200,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                    vertical: 7.5.h,
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 48.h,
                        ),
                        ProfileTile(
                          title: 'Invite friends',
                          iconPath: Assets.images.inviteFriends,
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
                path: Assets.images.avatar1.path,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final String iconPath;

  const ProfileTile({Key? key, required this.title, required this.iconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: ClashColors.black300,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: ClashColors.grey400,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          SizedBox(
            width: 16.w,
          ),
          Text(
            title,
            style: textTheme.subtitle1,
          ),
          const Spacer(),
          const Icon(
            Icons.keyboard_arrow_right_rounded,
            color: ClashColors.green200,
          )
        ],
      ),
    );
  }
}
