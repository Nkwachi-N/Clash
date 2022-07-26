import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';
import '../../../../../../colors.dart';
import '../../../../../core/constants/dimensions.dart';
import 'create_room_view_model.dart';

class CreateRoomView extends ViewModelBuilderWidget<CreateRoomViewModel> {
  const CreateRoomView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, CreateRoomViewModel model, Widget? child) {
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
          child: Form(
            key: model.formKey,
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
                TextFormField(
                  controller: model.controller,
                  validator: (value) => model.validateUserName(value),
                  onChanged: (value) => model.onChanged(value),
                  style: const TextStyle(
                    color: ClashColors.green200,
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    filled: true,
                    fillColor: ClashColors.grey500,
                    hintText: 'username (at least 3 characters)',
                    suffixIcon: Visibility(
                      visible: model.userNameIsValid,
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
                  onPressed: model.userNameIsValid
                      ? () => model.inviteUser()
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
                        visible: model.isBusy,
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
