import 'package:clash_flutter/colors.dart';
import 'package:clash_flutter/gen/assets.gen.dart';
import 'package:clash_flutter/src/features/features.dart';
import 'package:clash_flutter/src/features/home/actvity/view/activity_view.dart';
import 'package:clash_flutter/src/features/home/profile/views/profile_view.dart';
import 'package:clash_flutter/src/features/home/views/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 30.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.07),
            borderRadius: BorderRadius.circular(40.0),
            border: Border.all(
              color: const Color(0xFF323232),
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => viewModel.setIndex(0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Assets.images.home,
                      color: viewModel.currentIndex != 0
                          ? IconTheme.of(context).color
                          : ClashColors.green200,
                      height: 25.0,
                      width: 25.0,
                    ),
                    Visibility(
                      visible: viewModel.currentIndex == 0,
                      child: const NavCircle(),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 46.0,
              ),
              InkWell(
                onTap: () => viewModel.setIndex(1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Assets.images.stat,
                      color: viewModel.currentIndex != 1
                          ? IconTheme.of(context).color
                          : ClashColors.green200,
                      height: 25.0,
                      width: 25.0,
                    ),
                    Visibility(
                      visible: viewModel.currentIndex == 1,
                      child: const NavCircle(),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 46.0,
              ),
              InkWell(
                onTap: () => viewModel.setIndex(2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Assets.images.profile,
                      color: viewModel.currentIndex != 2
                          ? IconTheme.of(context).color
                          : ClashColors.green200,
                      height: 30.0,
                      width: 30.0,
                    ),
                    Visibility(
                      visible: viewModel.currentIndex == 2,
                      child: const NavCircle(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: viewModel.currentIndex,
          children: const [
            ClashModeScreen(),
            ActivityView(),
            ProfileView(),
          ],
        ));
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.init();
}

class NavCircle extends StatelessWidget {
  const NavCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.r,
      width: 4.r,
      margin: EdgeInsets.only(top: 6.5.h),
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: ClashColors.green200),
    );
  }
}
