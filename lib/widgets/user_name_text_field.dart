import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/core/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class UserNameTextField extends StatelessWidget {

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  const UserNameTextField({Key? key, required this.controller,this.onChanged,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<UserProvider>();
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
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
          onChanged;
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
        filled: true,
        fillColor: ClashColors.grey500,
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
        hintStyle: const TextStyle(
          color: ClashColors.grey900,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
    );
  }
}
