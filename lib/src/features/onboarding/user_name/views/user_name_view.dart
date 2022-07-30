import 'package:clash_flutter/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

import 'user_name_view_model.dart';

class UserNameView extends ViewModelBuilderWidget<UserNameViewModel> {
  const UserNameView({Key? key}) : super(key: key);


  @override
  Widget builder(BuildContext context, UserNameViewModel viewModel, Widget? child) {
    final textTheme = Theme.of(context).textTheme;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: ClashColors.green100,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Form(
            key: viewModel.formKey,
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
                  controller: viewModel.controller,
                  validator: (value) => viewModel.validateField(value),
                  onChanged: viewModel.fieldChanged,
                  style: const TextStyle(
                    color: ClashColors.green100,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    hintText: 'username (at least 3 characters)',
                    suffixIcon: Visibility(
                      visible: viewModel.userNameProgress == UserNameState.notFound,
                      replacement: Visibility(
                        visible:
                        viewModel.userNameProgress == UserNameState.loading,
                        child: const SizedBox(
                          width: 10.0,
                          child: SpinKitThreeBounce(
                            color: ClashColors.green100,
                            size: 10.0,
                          ),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(
                          9.0,
                        ),
                        decoration: const BoxDecoration(
                          color: ClashColors.green100,
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
                  onPressed: viewModel.userNameProgress == UserNameState.notFound
                      ? () async {
                    viewModel.saveUserName();
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
                        visible: viewModel.storingUserName,
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
  UserNameViewModel viewModelBuilder(BuildContext context) => UserNameViewModel();
}
