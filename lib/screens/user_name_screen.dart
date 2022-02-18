import 'package:clash_flutter/colors.dart';
import 'package:flutter/material.dart';

class UserNameScreen extends StatefulWidget {
  const UserNameScreen({Key? key}) : super(key: key);

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  late TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(
            color: green200,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Form(
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
                  height: 16.0,
                ),
                Container(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: grey500,
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
                          color: grey900,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          onSubmitted: (value) {
                            setState(() {

                            });
                          },
                          style: const TextStyle(color: green200, fontSize: 18.0),
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(4.0),
                              filled: true,
                              fillColor: grey500,
                              hintText: 'username',
                              isDense: true,
                              hintStyle: TextStyle(
                                color: grey900,
                              ),
                              border:
                                  OutlineInputBorder(borderSide: BorderSide.none),
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
                            color: green200,
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
                TextButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {

                    }
                  },
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
