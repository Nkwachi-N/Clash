import 'package:clash_flutter/src/features/onboarding/start_up/views/start_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends ViewModelBuilderWidget<StartUpViewModel> {
  const StartUpView({Key? key}) : super(key: key);


  @override
  void onViewModelReady(StartUpViewModel viewModel) => viewModel.init();

  @override
  Widget builder(BuildContext context, StartUpViewModel viewModel, Widget? child) {
   return Scaffold(
     backgroundColor: Colors.pink,
   );
  }

  @override
  StartUpViewModel viewModelBuilder(BuildContext context) => StartUpViewModel();
}
