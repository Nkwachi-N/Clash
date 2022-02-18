import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';

class JoinClashRoom extends StatefulWidget {
  const JoinClashRoom({Key? key}) : super(key: key);

  @override
  _JoinClashRoomState createState() => _JoinClashRoomState();
}

class _JoinClashRoomState extends State<JoinClashRoom> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  final otpLength = 6;

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 32.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,),
            child: Text(
              'Join a clash room',
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Enter your friend’s clash room code to be able to join',
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height:8.0,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    otpLength,
                        (index) {
                      String text = '';
                      String controllerText = _controller.text;
                      if (controllerText.length > index) {
                        text = controllerText[index];
                      }
                      return Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Center(
                            child: Text(
                              text,
                              style: textTheme.headline4?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: green200,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                visible: false,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                maintainInteractivity: true,
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  maxLength: otpLength,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^[0-9]+$')),
                  ],
                  onChanged: (value) {
                    setState(() {});
                    if (value.length == otpLength) {
                      _focusNode.unfocus();
                    }
                  },
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextButton(
              onPressed: _controller.text.length > 5 ? () {} : null,
              child: Text(
                'Join room',
                style: textTheme.button,
              ),
            ),
          ),
          const SizedBox(
            height: 32.0,
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
