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
                    'Welcome back, Emmanuel 👋 ',
                    style: textTheme.subtitle1,
                  ),
                  const Spacer(),
                  SvgPicture.asset(Assets.images.flame),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text('0',style: textTheme.headline5,)

                ],
              ),
              SizedBox(
                height: 71.h,
              ),
              Text(
                'How do you want to Clash?',
                style: textTheme.subtitle2,
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: Container(
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
                      Assets.images.miroodlesColorComp.image(),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        'With a Computer',
                        style: textTheme.headline6?.copyWith(
                          color: ClashColors.green200,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Play against an automated system.',
                        style: textTheme.subtitle1?.copyWith(
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
                            /*Image.asset(
                          Assets.images.avatar1.path,
                          height: _kImageSize,
                          width: _kImageSize,
                        ),*/ SizedBox(),
                            Positioned(
                              left: 40.0,
                              child:  /*Image.asset(
                          Assets.images.avatar1.path,
                          height: _kImageSize,
                          width: _kImageSize,
                        ),*/ SizedBox(),
                            ),
                            Positioned(
                              left: 80.0,
                              child:  /*Image.asset(
                          Assets.images.avatar1.path,
                          height: _kImageSize,
                          width: _kImageSize,
                        ),*/ SizedBox(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          'With Friends',
                          style: textTheme.headline6?.copyWith(
                            color: ClashColors.green200,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Mash heads with your gees and pals by inviting them to your clash room.',
                          style: textTheme.subtitle1?.copyWith(
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
