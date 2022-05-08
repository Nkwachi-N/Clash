import 'package:clash_flutter/core/constants.dart';
import 'package:clash_flutter/core/provider/game_provider.dart';
import 'package:clash_flutter/core/provider/user_provider.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../colors.dart';

class CreateClashRoom extends StatefulWidget {
  const CreateClashRoom({Key? key}) : super(key: key);

  @override
  State<CreateClashRoom> createState() => _CreateClashRoomState();
}

class _CreateClashRoomState extends State<CreateClashRoom> {
  late TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();

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
    final textTheme = Theme
        .of(context)
        .textTheme;
    final model = context.watch<UserProvider>();
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
            key: _formKey,
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
                  controller: _controller,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'please enter your friend\'s username';
                    } else if (value != null && value.length < 3) {
                      return 'username must be at least 3 characters';
                    }
                    if (model.userNameProgress == UserNameState.notFound) {
                      return 'Username does not exist, please check again.';
                    }
                    if (value == model.user.name) {
                      return 'You can\'t play a game with yourself.';
                    }
                    return null;
                  },
                  onChanged: (value) async {
                    if (value.length >= 3) {
                      await model.userNameCheck(value);
                      _formKey.currentState!.validate();
                    }
                  },
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
                      visible:
                      model.userNameProgress == UserNameState.exists &&
                          _controller.text != model.user.name,
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

                Consumer<GameProvider>(
                  builder: (_, __, child) {
                    return TextButton(
                         onPressed: model.userNameProgress == UserNameState.exists ? () => inviteUser() : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          child!,
                          const SizedBox(
                            width: 8.0,
                          ),
                          const Visibility(
                            visible: false,
                            child: SpinKitThreeBounce(
                            size: Constants.kButtonLoaderSize,
                            color: Colors.white,
                          ),),
                        ],
                      ),
                    );
                  },
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
      ),
    );
  }

   inviteUser() {
    context.read<GameProvider>().inviteUser(_controller.text).then((value){
      if(value){
        Navigator.of(context).pushNamed(RouteGenerator.inviteSentScreen,arguments: _controller.text);
      }else{
        const snackBar = SnackBar(content: Text('Invite sending failed, please try again'),);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}
