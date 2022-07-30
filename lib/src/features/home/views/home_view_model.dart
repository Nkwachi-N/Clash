import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../core/util/notification_util.dart';

class HomeViewModel extends BaseViewModel{

  final navigationService = locator<NavigationService>();


  void init() {
    NotificationUtil.setupInteractedMessage();

  }




  void createRoom  () {
    navigationService.navigateTo(Routes.profileView);
  }
}