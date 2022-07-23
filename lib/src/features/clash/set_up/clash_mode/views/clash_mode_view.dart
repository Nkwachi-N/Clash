import 'package:clash_flutter/routes/route_generator.dart';
import 'package:clash_flutter/src/features/clash/set_up/clash_mode/views/clash_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../../../colors.dart';

class ClashModeScreen extends ViewModelBuilderWidget<ClashModeViewModel> {
  const ClashModeScreen({Key? key}) : super(key: key);


  @override
  Widget builder(BuildContext context, ClashModeViewModel viewModel, Widget? child) {
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
                height: 16.0,
              ),
              Text(
                'How do you want to Clash?',
                style: textTheme.headline6,
              ),
              const SizedBox(
                height: 32.0,
              ),
              Expanded(
                child : Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: ClashColors.grey500,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFCBD21),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Text('Coming Soon', style: textTheme.subtitle2),
                        ),
                      ),
                      Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.orange),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        'With a Computer',
                        style: textTheme.headline5?.copyWith(
                          color: ClashColors.green200,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Play against an automated system.',
                        style: textTheme.subtitle1?.copyWith(
                          fontSize: 16.0,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed(RouteGenerator.hostModeScreen),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: ClashColors.grey500,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(
                              'assets/images/avatar_1.png',
                              height: 60.0,
                              width: 60.0,
                            ),
                            Positioned(
                              left: 40.0,
                              child: Image.asset(
                                'assets/images/avatar_3.png',
                                height: 60.0,
                                width: 60.0,
                              ),
                            ),
                            Positioned(
                              left: 80.0,
                              child: Image.asset(
                                'assets/images/avatar_5.png',
                                height: 60.0,
                                width: 60.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          'With Friends',
                          style: textTheme.headline5?.copyWith(
                            color: ClashColors.green200,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Mash heads with your gees and pals by inviting them to your clash room.',
                          style: textTheme.subtitle1?.copyWith(
                            fontSize: 16.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ClashModeViewModel viewModelBuilder(BuildContext context) => ClashModeViewModel();
}
