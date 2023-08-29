import 'package:clash_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../../../../../colors.dart';
import 'clash_mode_view_model.dart';

class ClashModeScreen extends ViewModelBuilderWidget<ClashModeViewModel> {
  const ClashModeScreen({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ClashModeViewModel viewModel, Widget? child) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Row(
                children: [
                  Text(
                    'Welcome back, ${viewModel.name} 👋 ',
                    style: textTheme.titleMedium,
                  ),
                  const Spacer(),
                  SvgPicture.asset(Assets.images.flame),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    '0',
                    style: textTheme.headlineSmall,
                  )
                ],
              ),
              SizedBox(
                height: 71.h,
              ),
              Text(
                'How do you want to Clash?',
                style: textTheme.titleSmall,
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.w),
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
                          child: Text(
                            'Coming Soon',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ),
                      Assets.images.miroodlesColorComp.image(
                        width: 50.w,
                        height: 50.w,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'With a Computer',
                        style: textTheme.titleLarge?.copyWith(
                          color: ClashColors.green200,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Play against an automated system.',
                        style: textTheme.titleMedium?.copyWith(
                          color: ClashColors.grey400,
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
                  onTap: viewModel.navigateToHostModeView,
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
                              Assets.images.avatar1.path,
                            ),
                            const SizedBox(),
                            Positioned(
                              left: 40.0,
                              child: Image.asset(
                                Assets.images.avatar2.path,
                              ),
                            ),
                            const SizedBox(),
                            Positioned(
                              left: 80.0,
                              child: Image.asset(
                                Assets.images.avatar3.path,
                              ),
                            ),
                            const SizedBox(),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          'With Friends',
                          style: textTheme.titleLarge?.copyWith(
                            color: ClashColors.green200,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Mash heads with your gees and pals by inviting them to your clash room.',
                          style: textTheme.titleMedium?.copyWith(
                            color: ClashColors.grey400,
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
  ClashModeViewModel viewModelBuilder(BuildContext context) =>
      ClashModeViewModel();
}
