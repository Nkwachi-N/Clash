import 'package:clash_flutter/colors.dart';
import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  final List<Color> colors;
  final String text;
  final bool selected;

  const GradientCard({
    Key? key,
    required this.colors,
    required this.text,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Visibility(
              visible: selected,
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                    padding: const EdgeInsets.all(
                      1.0,
                    ),
                    decoration: const BoxDecoration(
                      color: ClashColors.green100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                    )),
              ),
            ),
          ),
          Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}





