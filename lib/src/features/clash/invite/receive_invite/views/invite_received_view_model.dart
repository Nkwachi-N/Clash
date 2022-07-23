import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InviteReceivedViewModel extends BaseViewModel{

  final _gameRepository = locator<GameRepository>();
  final _navigationService = locator<NavigationService>();
  InviteState get inviteState => _gameRepository.inviteState;



  void declineInvite(String userName) {
    setBusy(true);
    _gameRepository.decide(userName,InviteState.declined).then((value) {
      if (value) {
        /*  if (Navigator.canPop(context)) {
          _gameRepository
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
              RouteGenerator.homeScreen, (
              route) => false);
        }
      } else {
        _showSnackBar(context, 'Error declining invite, please try again.');
      }*/
      }
    });
  }


  void acceptInvite(String userName) {
    setBusy(true);
    _gameRepository.decide(userName,InviteState.accepted).then((value) {
    /*  if (value) {
        Navigator.of(context).pushNamed(
          RouteGenerator.successScreen,
          arguments: SuccessScreenArgs(
              title: 'You’ve joined $userName’s clash room',
              onTap: () {
                //TODO:Navigate to game screen.
              },
              subtitle: 'The stage is set'),
        );
      } else {
        _showSnackBar(context, 'Error accepting invite, please try again.');
      }*/
    });
  }
}


