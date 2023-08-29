import 'package:clash_flutter/src/core/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../core/app/app.router.dart';
import '../../../../../core/models/user.dart';
import '../../../../../core/services/database/database.dart';

class ClashModeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userRepo = locator<UserDatabaseService>();

  User? get user => _userRepo.getCurrentUser();

  String get name => user?.name ?? '';

  void navigateToHostModeView() {
    _navigationService.navigateTo(Routes.categoryView);
  }

}
