import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  final List<Color> colors;
  final String text;

  const GradientCard({Key? key, required this.colors, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          gradient:  LinearGradient(
            colors:colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
      ),
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(text,style: Theme.of(context).textTheme.headline4?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),),
      ),
    );
  }
}
