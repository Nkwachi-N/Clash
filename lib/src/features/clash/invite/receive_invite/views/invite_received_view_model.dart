import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:clash_flutter/widgets/success_screen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../core/constants/snack_bar_type.dart';

class InviteReceivedViewModel extends BaseViewModel {
  final _notificationService = locator<NotificationService>();
  final _navigationService = locator<NavigationService>();
  final _snackBarService = locator<SnackbarService>();
  final _gameService = locator<GameService>();

  String loaderMessage = '';

  Future<void> declineInvite(String userId) async {
    loaderMessage = 'declining invite';
    setBusy(true);
    bool status = await _notificationService.rejectInvite(userId);
    setBusy(false);

    if (status) {
      _navigationService.back();
    } else {
      _snackBarService.showCustomSnackBar(
        message: 'Error declining invite, please try again.',
        variant: SnackBarType.error,
      );
    }
  }

  Future<void> acceptInvite({required String userId,required String username}) async {
    loaderMessage = 'accepting invite';
    setBusy(true);
    bool status = await _notificationService.acceptInvite(userId);
    setBusy(false);

    if (status) {
      _navigationService.navigateToView(
        SuccessScreen(
          args: SuccessScreenArgs(
              title: 'You’ve joined $username’s clash room',
              onTap: () {
                _gameService.gameId = userId;
                //TODo:
                // _navigationService.navigateTo(Routes.waitingRoomView);
              },
              subtitle: 'The stage is set'),
        ),
      );
    } else {
      _snackBarService.showCustomSnackBar(
        message: 'Error accepting invite, please try again.',
        variant: SnackBarType.error,
      );
    }
  }
}
