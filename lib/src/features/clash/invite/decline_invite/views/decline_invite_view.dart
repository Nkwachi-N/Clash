import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/src/features/clash/invite/decline_invite/views/decline_invite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DeclineInviteView extends ViewModelBuilderWidget<DeclineInviteViewModel> {

  final String username;

  const DeclineInviteView( {
    Key? key,
    required this.username,
  }) : super(key: key);


  @override
  Widget builder(BuildContext context, DeclineInviteViewModel viewModel, Widget? child) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Center(child: Image.asset('assets/images/warning.png')),
            const SizedBox(
              height: 80.0,
            ),
            Text(
              '$username declined your invite',
              textAlign: TextAlign.center,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Ouch',
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w400,
                color: ClashColors.grey900,
                fontSize: 18.0,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              child: const Text(
                'Cancel',
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Try again',),
            ),
            const SizedBox(
              height: 32.0,
            )
          ],
        ),
      ),
    );
  }

  @override
  DeclineInviteViewModel viewModelBuilder(BuildContext context) => DeclineInviteViewModel();
}
