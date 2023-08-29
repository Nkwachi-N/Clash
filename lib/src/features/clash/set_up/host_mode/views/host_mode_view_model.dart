import 'package:clash_flutter/src/core/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../core/app/app.router.dart';

class HostModeViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();

  void navigateToCategoryView() {
    _navigationService.navigateTo(Routes.categoryView);
  }

  void navigateToJoinClashRoomView() {
    _navigationService.navigateTo(Routes.joinRoomView);
  }
}