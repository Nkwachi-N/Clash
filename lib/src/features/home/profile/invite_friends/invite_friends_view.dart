import 'package:clash_flutter/src/features/home/profile/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../../../gen/assets.gen.dart';
import 'invite_friends_view_model.dart';

class InviteFriendsView extends ViewModelBuilderWidget<InviteFriendsViewModel> {
  const InviteFriendsView({Key? key}) : super(key: key);


  @override
  Widget builder(BuildContext context, InviteFriendsViewModel viewModel, Widget? child) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 46.h,
            ),
            Text('What would you like to edit?',style: textTheme.titleLarge,),
            SizedBox(
              height: 48.h,
            ),
            ProfileTile(
              title: 'My Username',
              iconPath: Assets.images.inviteFriends,
              onTap: viewModel.toUserNameView,
            ),
            SizedBox(
              height: 12.h,
            ),


          ],
        ),
      ),
    );
  }

  @override
  InviteFriendsViewModel viewModelBuilder(BuildContext context) => InviteFriendsViewModel();
}
