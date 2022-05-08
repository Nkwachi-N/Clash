import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/core/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../routes/route_generator.dart';

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  _AvatarScreenState createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final model = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: ClashColors.green200,
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
              'What avatar best describes you?',
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
                  imageIndex: ++index,
                ),
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
                  imageIndex: index + 4,
                ),
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
                  imageIndex: index + 7,
                ),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () async {
                bool status = await model.storeAvatar();
                if(status){
                  Navigator.of(context).pushReplacementNamed(RouteGenerator.homeScreen);
                }else{
                  const snackBar = SnackBar(content: Text('Unable to save avatar'),);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Continue',
                    style: textTheme.button,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Visibility(
                    visible: model.storingAvatar,
                    child: const SpinKitThreeBounce(
                      color: Colors.white,
                      size: 10.0,
                    ),
                  )
                ],
              ),
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
  final int imageIndex;

  const AvatarWidget({
    Key? key,
    required this.imageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<UserProvider>();
    return InkWell(
      onTap: () {
        model.changeAvatar(imageIndex);
      },
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: imageIndex == model.selectedAvatar
                ? Colors.green
                : Colors.transparent,
            width: 2.0,
          ),
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(
              'assets/images/avatar_$imageIndex.png',
            ),
          ),
        ),
      ),
    );
  }
}
