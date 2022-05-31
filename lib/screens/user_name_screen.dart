import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/core/provider/user_provider.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class UserNameScreen extends StatelessWidget {
  UserNameScreen({Key? key}) : super(key: key);


  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
    final model = context.watch<UserProvider>();
    final controller = useTextEditingController();

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
              TextFormField(
                controller: controller,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'please enter your username';
                  } else if (value != null && value.length < 3) {
                    return 'username must be at least 3 characters';
                  }
                  if (model.userNameProgress == UserNameState.exists) {
                    return 'Username is not available';
                  }
                  return null;
                },
                onChanged: (value) async {
                  if (value.length >= 3) {
                    await model.userNameCheck(value);
                    _formKey.currentState!.validate();
                  }else {
                    model.resetUserNameState();
                  }
                },
                style: const TextStyle(
                  color: ClashColors.green200,
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8.0),

                  hintText: 'username (at least 3 characters)',
                  suffixIcon: Visibility(
                    visible:
                    model.userNameProgress == UserNameState.notFound,
                    replacement: Visibility(
                      visible:
                      model.userNameProgress == UserNameState.loading,
                      child: const SizedBox(
                        width: 10.0,
                        child: SpinKitThreeBounce(
                          color: ClashColors.green200,
                          size: 10.0,
                        ),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(
                        9.0,
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
                  prefixIcon: SizedBox(
                    width: 20.0,
                    child: Center(
                      child: Text(
                        '@',
                        style: textTheme.headline5?.copyWith(
                          color: ClashColors.grey900,
                        ),
                      ),
                    ),
                  ),
                  isDense: true,

                ),
              ),
                const Spacer(),
                TextButton(
                  onPressed:model.userNameProgress == UserNameState.notFound ? () async {
                    if (_formKey.currentState!.validate()) {
                      bool status = await model.storeUserName(controller.text);

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
                  } : null,
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


}
