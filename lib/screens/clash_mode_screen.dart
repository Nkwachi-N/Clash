import 'package:flutter/material.dart';

import '../constants.dart';

class ClashModeScreen extends StatefulWidget {
  const ClashModeScreen({Key? key}) : super(key: key);

  @override
  _ClashModeScreenState createState() => _ClashModeScreenState();
}

class _ClashModeScreenState extends State<ClashModeScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: green200,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16.0,
          ),
          Text(
            'What would you like to be called?',
            style: textTheme.headline6,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            padding: const EdgeInsets.all(16.0,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                4.0,
              ),
              color: grey500,
            ),
            child: Column(
              children: [
                Text('With a Computer',style: textTheme.headline5?.copyWith(
                  color: green200,
                ),),
                const SizedBox(
                  height: 16.0,
                ),
                Text('Play against an automated system',style: textTheme.headline6?.copyWith(
                  color: black200,
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
