import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../core/app/app.locator.dart';
import '../../../../core/repository/repository.dart';

class AvatarViewModel extends BaseViewModel{

  final _userRepository = locator<UserRepository>();
  final _snackBarService = locator<SnackbarService>();

  String? selectedAvatar;


  Future<void> saveAvatar() async {

    bool status = await _storeAvatar();

    if (status) {
      //TODO: navigate to home screen
    } else {
     _snackBarService.showSnackbar(message: 'Unable to save avatar');
    }
  }

  void changeAvatar(String avatarPath) {
    selectedAvatar = avatarPath;
    notifyListeners();
  }

  Future<bool> _storeAvatar() async {
    setBusy(true);

    bool status = await _userRepository.saveAvatar(selectedAvatar!);

    setBusy(false);
    notifyListeners();

    return status;
  }
}