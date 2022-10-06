import 'package:clash_flutter/src/core/app/index.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();


  void toInviteFriendsView() => _navigationService.navigateTo(Routes.inviteFriendsView);
}