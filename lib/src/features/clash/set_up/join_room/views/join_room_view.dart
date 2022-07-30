import 'package:clash_flutter/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'join_room_view_model.dart';

class JoinRoomView extends ViewModelBuilderWidget<JoinRoomViewModel>{


  const JoinRoomView({Key? key}) : super(key: key);


  @override
  Widget builder(BuildContext context, JoinRoomViewModel viewModel, Widget? child) {
    final textTheme = Theme.of(context).textTheme;
    final controller = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: ClashColors.green100,
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
                    viewModel.otpLength,
                        (index) {
                      String text = '';
                      String controllerText = controller.text;
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
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  )
                              )
                          ),
                          child: Center(
                            child: Text(
                              text,
                              style: textTheme.headline4?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: ClashColors.green100,
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
                  controller: controller,
                  focusNode: viewModel.focusNode,
                  maxLength: viewModel.otpLength,
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
                  onChanged: viewModel.onChanged,
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextButton(
              onPressed: controller.text.length > 5 ? () {} : null,
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
  JoinRoomViewModel viewModelBuilder(BuildContext context) => JoinRoomViewModel();


}
