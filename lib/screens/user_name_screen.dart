import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/core/provider/auth_provider.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:clash_flutter/widgets/user_name_text_field.dart';
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
    final textTheme = Theme
        .of(context)
        .textTheme;
    final model = context.watch<AuthProvider>();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                UserNameTextField(controller: _controller,
                  onChanged: (value) => _formKey.currentState!.validate(),),
                const Spacer(),
                TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool status = await model.storeUserName(_controller.text);
                      if (status) {
                        Navigator.of(context)
                            .pushReplacementNamed(RouteGenerator.avatarScreen);
                      } else {
                        const snackBar = SnackBar(
                            content:
                            Text('Something went wrong, please try again'));
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
