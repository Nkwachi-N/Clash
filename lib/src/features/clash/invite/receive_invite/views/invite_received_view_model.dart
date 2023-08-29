import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/models/category/category.dart';
import 'package:clash_flutter/src/core/services/service.dart';
import 'package:clash_flutter/widgets/success_screen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../core/constants/snack_bar_type.dart';
import '../../../../../core/models/game.dart';

class InviteReceivedViewModel extends BaseViewModel {
  final _notificationService = locator<NotificationService>();
  final _navigationService = locator<NavigationService>();
  final _snackBarService = locator<SnackbarService>();
  final _fireBaseService = locator<FireBaseService>();
  final _gameService = locator<GameService>();

  String loaderMessage = '';

  Future<void> declineInvite(String userId) async {
    loaderMessage = 'declining invite';
    final user = await _fireBaseService.getUserByUserId(userId);
    if (user == null || user.deviceToken == null) _navigationService.back();
    setBusy(true);
    bool status = await _notificationService.rejectInvite(user!.deviceToken!);
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

  Future<void> acceptInvite(
      {required String userId, required String username}) async {
    loaderMessage = 'accepting invite';
    setBusy(true);
    //check for game
    Game? game = await _fireBaseService.getGameById(userId);
    final user = await _fireBaseService.getUserByUserId(userId);

    if (user == null || user.deviceToken == null) _navigationService.back();
    if (game != null) {
      bool status = await _notificationService.acceptInvite(user!.deviceToken!);
      setBusy(false);
      if (status) {
        _navigationService.navigateToView(
          SuccessScreen(
            args: SuccessScreenArgs(
                title: 'You’ve joined $username’s clash room',
                onTap: () {
                  _gameService.game = game;
                  if (game.category is GenreCategory) {
                    _navigationService.navigateTo(Routes.genreWaitingRoomView);
                  }
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
}
