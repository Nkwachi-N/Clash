import 'package:flutter/material.dart';

import '../colors.dart';

class ModeTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  final GestureTapCallback? onTap;

  const ModeTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.icon = const SizedBox(), this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 32.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            4.0,
          ),
          color: ClashColors.grey500,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            Text(
              title,
              style: textTheme.headline6?.copyWith(
                color: ClashColors.green200,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              subtitle,
              style: textTheme.subtitle1?.copyWith(
                  color: ClashColors.grey400, fontWeight: FontWeight.w400,),
            )
          ],
        ),
      ),
    );
  }
}
