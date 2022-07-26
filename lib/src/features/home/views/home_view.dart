import 'package:clash_flutter/gen/assets.gen.dart';
import 'package:clash_flutter/src/features/home/views/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(22.0),
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
            SvgPicture.asset(
              Assets.images.home,
              color: IconTheme.of(context).color,
              height: 25.0,
              width: 25.0,
            ),
            const SizedBox(
              width: 46.0,
            ),
            SvgPicture.asset(
              Assets.images.stat,
              color: IconTheme.of(context).color,
              height: 25.0,
              width: 25.0,
            ),
            const SizedBox(
              width: 46.0,
            ),
            SvgPicture.asset(
              Assets.images.profile,
              color: IconTheme.of(context).color,
              height: 30.0,
              width: 30.0,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
            child: TextButton(
          onPressed: viewModel.createRoom,
          child: const Text(
            'Play',
          ),
        )),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.init();
}
