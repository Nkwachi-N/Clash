import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/services/game/game.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CategoryViewModel extends BaseViewModel{

  final _gameRepo = locator<GameService>();
  final _navigationService = locator<NavigationService>();



  toGenreCategory() {

  }

  toArtistCategoryView() {}
}