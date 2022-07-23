import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/routes/route_generator.dart';
import 'package:clash_flutter/widgets/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ReceivedInviteScreen extends StatelessWidget {
  final String userName;

  const ReceivedInviteScreen({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
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
                child:
                Text('$userName is inviting you to join their clash room',
                  textAlign: TextAlign.center,
                  style: textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),),
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
              Selector<GameProvider, bool>(
                  selector: (context, provider) => provider.decidingInvite,
                  builder: (context, decidingInvite, child) {
                    return Row(
                      children: [
                        Expanded(
                            child: TextButton(
                              onPressed: decidingInvite ? null : () => declineInvite(context),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.resolveWith((states){
                                    if(states.contains(MaterialState.disabled)) {
                                      return ClashColors.grey700;
                                    }
                                    return ClashColors.red;
                                  })
                              ),
                              child: const Text('Decline'),
                            )),
                        const SizedBox(
                          width: 13.0,
                        ),
                        Expanded(
                            child: TextButton(
                              onPressed: decidingInvite ? null : () => acceptInvite(context),
                              child: const Text('Accept'),
                            )),
                      ],
                    );
                  }
              ),
              const SizedBox(
                height: 16.0,
              ),
              Selector<GameProvider,InviteState>(
                  selector: (context, provider) => provider.inviteState,
                  builder: (context, invite,child) {
                    return Visibility(
                      visible: invite != InviteState.unDecided,
                      replacement: const SizedBox(
                        height: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('${invite.toMessage()} invite', style:textTheme.subtitle1?.copyWith(
                            color: ClashColors.green200,
                          ),),
                          const SizedBox(
                            width: 4.0,
                          ),
                          const SpinKitThreeBounce(
                            color: ClashColors.green200,
                            size: Constants.kButtonLoaderSize,
                          )
                        ],
                      ),
                    );
                  }
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

  void acceptInvite(BuildContext context) {
    context.read<GameProvider>().decide(userName,InviteState.accepted).then((value) {
      if (value) {
        Navigator.of(context).pushNamed(
          RouteGenerator.successScreen,
          arguments: SuccessScreenArgs(
              title: 'You’ve joined $userName’s clash room',
              onTap: () {
                //TODO:Navigate to game screen.
              },
              subtitle: 'The stage is set'),
        );
      } else {
        _showSnackBar(context, 'Error accepting invite, please try again.');
      }
    });
  }

  void declineInvite(BuildContext context) {
    context.read<GameProvider>().decide(userName,InviteState.declined).then((value) {
      if (value) {
        if (Navigator.canPop(context)) {
          Navigator.of(context).pop();
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
              RouteGenerator.homeScreen, (
              route) => false);
        }
      } else {
        _showSnackBar(context, 'Error declining invite, please try again.');
      }
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
