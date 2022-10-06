import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../colors.dart';

class ActivityTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final String subtitle;
  final TextStyle? subtitleTextStyle;

  const ActivityTile({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.subtitle,
    this.subtitleTextStyle,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.only(
        top: 37.h,
        right: 22.w,
        bottom: 37.h,
        left: 22.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: ClashColors.black300,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 37.h,
          ),
          Container(
            height: 48.w,
            width: 48.w,
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
             imagePath,
              height: 26.w,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            title,
            style: textTheme.subtitle2,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            subtitle,
            style: subtitleTextStyle ?? textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
