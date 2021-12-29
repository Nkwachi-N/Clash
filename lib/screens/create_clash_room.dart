import 'package:flutter/material.dart';

import '../constants.dart';

class CreateClashRoom extends StatefulWidget {
  const CreateClashRoom({Key? key}) : super(key: key);

  @override
  State<CreateClashRoom> createState() => _CreateClashRoomState();
}

class _CreateClashRoomState extends State<CreateClashRoom> {
  late TextEditingController _controller;


  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                height: 32.0,
              ),
              Text(
                'Create a clash room',
                style: textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                'Enter your friend’s username or share your clash room code for them to join',
                style: textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: grey500,
                  contentPadding: const EdgeInsets.all( 20.0,),
                  hintText: '@ friend\'s username',
                  hintStyle: const TextStyle(
                    color: grey900,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                  ),
                ),
              ),
              const Spacer(
              ),
              Center(
                child: Text(
                  'Clash Room Code',
                  style: textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Center(
                child: Text('513 809',style: textTheme.headline3?.copyWith(
                  color: green200,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 12.0,
                ),),
              ),
              const Spacer(
                flex: 2,
              ),
              TextButton(
                onPressed: _controller.text.isNotEmpty ? (){} : null,

                child: Text(
                  'Invite friend',
                  style: textTheme.button,
                ),
              ),
              const SizedBox(
                height: 32.0,
              )

            ],

          ),
        ),
      ),
    );
  }
}
