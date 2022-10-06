import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../core/app/app.locator.dart';
import '../../../../core/app/app.router.dart';
import '../../../../core/constants/constants.dart';

class StartUpViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();

  void init() async{
    String initialRoute = Routes.authView;

    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(PrefConstants.kAccessToken);

    /*if (accessToken != null) {
      final box = Hive.box(PrefConstants.kHiveBox);
      final User? user = box.get('user');
      if (user != null) {
        initialRoute = Routes.homeView;
      } else {
        initialRoute = Routes.userNameView;
      }
    }*/

    _navigationService.navigateTo(initialRoute);



  }
}