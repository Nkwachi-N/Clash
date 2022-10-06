import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final bool selected;
  final String path;
  final VoidCallback onTap;

  const AvatarWidget({
    Key? key,
    this.selected = false,
    required this.path,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: selected ? Colors.green : Colors.transparent,
            width: 2.0,
          ),
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(
              path,
            ),
          ),
        ),
      ),
    );
  }
}