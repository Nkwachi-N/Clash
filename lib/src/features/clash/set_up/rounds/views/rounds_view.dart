import 'package:clash_flutter/src/features/clash/set_up/rounds/views/rounds_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../colors.dart';
import '../../../../../../widgets/gradient_card.dart';

class RoundsView extends ViewModelBuilderWidget<RoundsViewModel> {
  const RoundsView({Key? key}) : super(key: key);



  @override
  Widget builder(BuildContext context, RoundsViewModel model, Widget? child) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: ClashColors.green200,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 32.0,
            ),
            Text(
              'How do you want to Clash?',
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Choose how you’ll be playing with your friends',
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Text(
              'Choose number of rounds',
              style: textTheme.headline5?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => model.selectRounds(5),
                        child: const GradientCard(
                          colors: [
                            Color(0xFF38F4BD),
                            Color(0xFF41EC8B),
                          ],
                          text: '5 rounds',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => model.selectRounds(10),
                        child: const GradientCard(
                          colors: [
                            Color(0xFFF3A469),
                            Color(0xFF6659AD),
                          ],
                          text: '10 rounds',
                        ),
                      ),
                    ),
                  ],
                )),
            const Spacer(
              flex: 3,
            ),
            const SizedBox(
              height: 16.0,
            )
          ],
        ),
      ),
    ));
  }

  @override
  RoundsViewModel viewModelBuilder(BuildContext context) => RoundsViewModel();
}
