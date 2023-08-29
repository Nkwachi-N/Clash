import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/services/database/database.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dbService = locator<UserDatabaseService>();

  void toInviteFriendsView() =>
      _navigationService.navigateTo(Routes.inviteFriendsView);

  logOut() => {
    _dbService.nukeDb(),
    _navigationService.clearStackAndShow(Routes.authView)
  };
}
