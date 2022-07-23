import 'package:clash_flutter/src/core/app/index.dart';
import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/models/game.dart';

class CategoryViewModel extends BaseViewModel{

  final _gameRepo = locator<GameRepository>();

  void navigateToSubCategoryScreen(Category category) {
    _gameRepo.selectCategory(category);
   //TODO: navigate to sub category screen;
  }
}