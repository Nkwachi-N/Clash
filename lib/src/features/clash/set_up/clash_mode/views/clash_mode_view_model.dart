import 'package:clash_flutter/src/core/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../core/app/app.router.dart';

class ClashModeViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();

  void navigateToHostModeView() {
    _navigationService.navigateTo(Routes.hostModeView);
  }
}