import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:stacked/stacked.dart';
import '../../../core/util/notification_util.dart';

class HomeViewModel extends BaseViewModel{

  final _spotifyRepository = locator<SpotifyRepository>();

  void init() {
    NotificationUtil.setupInteractedMessage();

  }



}