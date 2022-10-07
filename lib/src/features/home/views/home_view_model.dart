import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../core/models/user.dart';

class HomeViewModel extends IndexTrackingViewModel{

  final navigationService = locator<NavigationService>();
  final _notificationService = locator<NotificationService>();
  final _userRepo = locator<UserDatabaseService>();

  User? get user => _userRepo.getCurrentUser();

  String get name => user?.name ?? '';

  void init() {
    _notificationService.setupInteractedMessage();
    _notificationService.setUserId(user?.id);
  }


  void createRoom  () {
    navigationService.navigateTo(Routes.profileView);
  }

}