import 'package:clash_flutter/src/features/clash/set_up/rounds/views/rounds_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          color: ClashColors.green100,
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
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Choose how you’ll be playing with your friends',
              style: textTheme.titleMedium?.copyWith(
                color: ClashColors.grey900,
              ),
            ),
            const Spacer(),
            Text(
              'Choose number of rounds',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              )
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
              flex: 4,
            ),
          ],
        ),
      ),
    ));
  }

  @override
  RoundsViewModel viewModelBuilder(BuildContext context) => RoundsViewModel();
}
