import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/assets.gen.dart';

class AvatarWidget extends StatelessWidget {
  final String avatar;

  const AvatarWidget({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: avatar.isNotEmpty,
      replacement: Center(
        child: Image.asset(
          Assets.images.avatar1.path,
          height: 105.w,
          width: 105.w,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 140.0,
            width: 140.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF434343).withOpacity(0.58),
            ),
          ),
          Container(
            height: 130.0,
            width: 130.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF686868).withOpacity(0.3),
            ),
          ),
          Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage(
                  avatar,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
