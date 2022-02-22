import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/core/provider/auth_provider.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

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
            color: ClashColors.green200,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Form(
            key: _formKey,
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
                            if(value != null && value.isEmpty) {
                              return 'please enter your username';
                            }else if(value != null && value.length < 3) {
                              return 'username must be at least 3 characters';
                            }
                            return null;
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
                Consumer<AuthProvider>(builder: (_, model, child) {
                  return TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        bool status =
                            await model.storeUserName(_controller.text);
                        if (status) {
                          Navigator.of(context).pushReplacementNamed(RouteGenerator.avatarScreen);
                        } else {
                          const snackBar = SnackBar(content: Text('Something went wrong, please try again'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
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
                          width: 8.0,
                        ),
                        Visibility(
                          visible: model.storingUserName,
                          child: const SpinKitThreeBounce(
                            size: 10.0,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  );
                }),
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
