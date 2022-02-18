import 'package:clash_flutter/colors.dart';
import 'package:flutter/material.dart';

import 'clash_mode_screen.dart';

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  _AvatarScreenState createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  String? selectedImage;

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'What would you like to be called?',
              style: textTheme.headline6,
            ),
            const SizedBox(
              height: 32.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (index) => AvatarWidget(
                    imagePath: 'avatar_${++index}',
                    selectedImage: selectedImage),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                    (index) => AvatarWidget(
                    imagePath: 'avatar_${index+4}',
                    selectedImage: selectedImage),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                    (index) => AvatarWidget(
                    imagePath: 'avatar_${index+7}',
                    selectedImage: selectedImage),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ClashModeScreen(),),);

              },
              child: Text('Continue',style: textTheme.button,),
            ),
            const SizedBox(
              height: 32.0,
            )
          ],
        ),
      ),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  final String imagePath;
  final String? selectedImage;

  const AvatarWidget({
    Key? key,
    required this.imagePath,
    required this.selectedImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$imagePath.png',
    );
  }
}
