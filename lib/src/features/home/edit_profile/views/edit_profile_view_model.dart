import 'package:clash_flutter/src/core/app/index.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditProfileViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();

  void navigateToUserNameView() => _navigationService.navigateTo(Routes.userNameView);

  void navigateToAvatarView() => _navigationService.navigateTo(Routes.avatarView);
}