import 'package:clash_flutter/colors.dart';
import 'package:flutter/material.dart';

class ReceivedInviteScreen extends StatelessWidget {
  final String userName;

  const ReceivedInviteScreen({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [

              Expanded(
                child: Image.asset('assets/images/exclamation.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('$userName is inviting you to join his clash room',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'What’s it going to be?',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: ClashColors.red,
                    ),
                    child: const Text('Decline'),
                  )),
                  const SizedBox(
                    width: 13.0,
                  ),
                  Expanded(
                      child: TextButton(
                    onPressed: () {},
                    child: const Text('Accept'),
                  )),
                ],
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
