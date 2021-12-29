import 'package:clash_flutter/widgets/mode_tile.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const BackButton(
            color: green200,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
               ModeTile(
                title: 'With a Computer',
                subtitle: 'Play against an automated system',
                icon: Stack(
                  alignment: Alignment.topRight,
                  clipBehavior: Clip.none,
                  children: [
/*
                    Container(
                       height:50.0,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle
                      ),
                    ),
*/
                    Container(
                      height:50.0,
                      decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle
                      ),
                    )

                  ],
                ),
              ),

              Container(
                color: Colors.red,
                child: Stack(
                  alignment: Alignment.topRight,
                  clipBehavior: Clip.none,
                  children: [
/*
                      Container(
                         height:50.0,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle
                        ),
                      ),
*/
                    Positioned(
                      top:30.0,
                      child: Container(
                        height:50.0,
                        decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

