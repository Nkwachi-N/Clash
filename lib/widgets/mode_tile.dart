import 'package:flutter/material.dart';

import '../constants.dart';

class ModeTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;

  const ModeTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.icon = const SizedBox(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 32.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          4.0,
        ),
        color: grey500,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          const SizedBox(
            height: 8.0,
          ),
          Text(
            title,
            style: textTheme.headline5?.copyWith(
              color: green200,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            subtitle,
            style: textTheme.headline6?.copyWith(
                color: black200, fontWeight: FontWeight.w400, fontSize: 18.0),
          )
        ],
      ),
    );
  }
}
