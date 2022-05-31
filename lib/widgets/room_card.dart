import 'package:clash_flutter/colors.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const RoomCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 8.0,
        bottom: 8.0,
      ),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: ClashColors.grey500,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.subtitle2?.copyWith(
                    color: ClashColors.grey900,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  subtitle,
                  style: textTheme.subtitle1?.copyWith(
                    color: ClashColors.grey400,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
