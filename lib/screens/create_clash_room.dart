import 'package:clash_flutter/routes/route_generator.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

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
        resizeToAvoidBottomInset: false,
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
                'Invite a friend',
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
              Container(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: ClashColors.grey500,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '@',
                      style: textTheme.headline5?.copyWith(
                        color: ClashColors.grey900,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _controller,
                        validator: (value){
                          if(value != null && value.length < 3) {
                            return 'username must be at least 3 characters';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {

                          });
                        },
                        style:
                        const TextStyle(color: ClashColors.green200, fontSize: 18.0),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(8.0),
                            filled: true,
                            fillColor: ClashColors.grey500,
                            hintText: 'username (at least 3 characters)',
                            isDense: true,
                            hintStyle: TextStyle(
                              color: ClashColors.grey900,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    Visibility(
                      visible: _controller.text.isNotEmpty,
                      child: Container(
                        margin: const EdgeInsets.all(
                          8.0,
                        ),
                        padding: const EdgeInsets.all(
                          2.0,
                        ),
                        decoration: const BoxDecoration(
                          color: ClashColors.green200,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: Text(
                  'Clash Room Code',
                  style: textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Center(
                child: Text(
                  '513 809',
                  style: textTheme.headline3?.copyWith(
                    color: ClashColors.green200,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 8.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Copy or Share',
                    style: textTheme.subtitle1?.copyWith(
                      color: ClashColors.grey900,
                      fontSize: 18.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: ClashColors.grey900,
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
              TextButton(
                onPressed: () =>Navigator.of(context).pushNamed(RouteGenerator.inviteSentScreen),
                child: Text(
                  'Continue',
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
