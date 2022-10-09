import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';
import '../../../../../../colors.dart';
import '../../../../../core/constants/dimensions.dart';
import 'create_room_view_model.dart';

class CreateRoomView extends ViewModelBuilderWidget<CreateRoomViewModel> {
  const CreateRoomView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, CreateRoomViewModel viewModel, Widget? child) {
    final textTheme = Theme.of(context).textTheme;


    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const BackButton(
            color: ClashColors.green100,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 32.0,
                ),
                Text(
                  'Create a clash room',
                  style: textTheme.headline6,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Enter your friend’s username or share your clash room code for them to join',
                  style: textTheme.subtitle1?.copyWith(
                    color: ClashColors.grey900,
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                TextFormField(
                  controller: viewModel.controller,
                  validator: (value) => viewModel.validateUserName(value),
                  onChanged: (value) => viewModel.onChanged(value),
                  style: const TextStyle(
                    color: ClashColors.green100,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    filled: true,
                    fillColor: ClashColors.grey500,
                    hintText: 'username (at least 3 characters)',
                    suffixIcon: Visibility(
                      visible: viewModel.userNameIsValid,
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
                ),
                const Spacer(),
                TextButton(
                  onPressed: viewModel.userNameIsValid
                      ? () => viewModel.createRoom()
                      : null,
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
                        visible: viewModel.isBusy,
                        child: const SpinKitThreeBounce(
                          size: kButtonLoaderSize,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  CreateRoomViewModel viewModelBuilder(BuildContext context) =>
      CreateRoomViewModel();
}
