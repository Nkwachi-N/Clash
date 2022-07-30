import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../core/models/game.dart';

class CategoryViewModel extends BaseViewModel{

  final _gameRepo = locator<GameRepository>();
  final _navigationService = locator<NavigationService>();

  void navigateToSubCategoryScreen(Category category) {
    _gameRepo.selectCategory(category);
    _navigationService.navigateTo(Routes.subCategoryScreen);

  }
}