import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../colors.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final GestureTapCallback? onTap;

  const ProfileTile({
    Key? key,
    required this.title,
    required this.iconPath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Container(
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
              style: textTheme.titleMedium,
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_right_rounded,
              color: ClashColors.green200,
            )
          ],
        ),
      ),
    );
  }
}
