import 'package:clash_flutter/colors.dart';
import 'package:flutter/material.dart';

class SetUpArmouryScreen extends StatelessWidget {
  const SetUpArmouryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: kToolbarHeight,
              ),
              Flexible(child: Image.asset('assets/images/exclamation.png')),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                'Set up your search_armoury',
                textAlign: TextAlign.center,
                style: textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'These are the songs you’ll be clashing with',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ClashColors.grey900,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 24.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: ClashColors.orangeIsh,
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.info, color: ClashColors.brown),
                        SizedBox(
                          width: 9.0,
                        ),
                        Text(
                          'Important',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: ClashColors.brown,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const Text(
                      'The popularity of a track is a value between 0 and 100, '
                          'with 100 being the most popular. The popularity is calculated by algorithm '
                          'and is based, in the most part, on the total number of plays the track has had and'
                          ' how recent those plays are.\n \nThe popularity value may lag actual popularity by a few days i.e '
                          'the value is not updated in real time.',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: ClashColors.brown200,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text('Okay, got it'),
              ),
              const SizedBox(
                height: 32.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
