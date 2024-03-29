import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';
import 'invite_received_view_model.dart';

class ReceivedInviteScreen
    extends ViewModelBuilderWidget<InviteReceivedViewModel> {
  final String userName;
  final String userId;

  const ReceivedInviteScreen( {
    required this.userName,
    required this.userId,

    Key? key,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context, InviteReceivedViewModel viewModel, Widget? child) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: Image.asset('assets/images/exclamation.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '$userName is inviting you to join their clash room',
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'What’s it going to be?',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                    onPressed: viewModel.isBusy
                        ? null
                        : () => viewModel.declineInvite(userId),
                    style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return ClashColors.grey700;
                      }
                      return ClashColors.red;
                    })),
                    child: const Text('Decline'),
                  )),
                  const SizedBox(
                    width: 13.0,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: viewModel.isBusy
                          ? null
                          : () => viewModel.acceptInvite(userId: userId,username: userName),
                      child: const Text('Accept'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Visibility(
                visible: viewModel.isBusy,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      viewModel.loaderMessage,
                      style: textTheme.titleMedium?.copyWith(
                        color: ClashColors.green100,
                      ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    const SpinKitThreeBounce(
                      color: ClashColors.green100,
                      size: kButtonLoaderSize,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  InviteReceivedViewModel viewModelBuilder(BuildContext context) =>
      InviteReceivedViewModel();
}
