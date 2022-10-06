import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:clash_flutter/src/core/services/user/user_service.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../core/util/notification_util.dart';

class HomeViewModel extends IndexTrackingViewModel{

  final navigationService = locator<NavigationService>();
  final _userRepo = locator<UserService>();


  void init() {
    NotificationUtil.setupInteractedMessage();
    OneSignal.shared.setExternalUserId(_userRepo.user.id);
  }


  void createRoom  () {
    navigationService.navigateTo(Routes.profileView);
  }

}