import 'package:clash_flutter/widgets/gradient_card.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

const greenYellow = [Color(0xFFF1EF47), Color(0xFF14D850)];
const redOrange = [Color(0xFFFF5857), Color(0xFFF0961B)];
const blue = [Color(0xFF6D88D7), Color(0xFF49C4EE)];
const purple = [Color(0xFFBF67D2), Color(0xFFEE609C)];

const colors = [greenYellow, redOrange, blue, purple];

class GenreScreen extends StatefulWidget {
  const GenreScreen({Key? key}) : super(key: key);

  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: ClashColors.green200,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 32.0,
            ),
            Text(
              'How do you want to Clash?',
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Choose how you’ll be playing with your friends',
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 64.0,
            ),
            Text(
              'Choose a genre',
              style: textTheme.headline5?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              flex: 2,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GradientCard(
                      colors: colors[index % 4],
                      text: 'Artist',
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextButton(
              onPressed: null,
              child: Text(
                'Continue',
                style: textTheme.button,
              ),
            ),
            const SizedBox(
              height: 16.0,
            )
          ],
        ),
      ),
    ));
  }
}
