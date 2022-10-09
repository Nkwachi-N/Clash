import 'package:clash_flutter/src/core/app/index.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CategoryViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  toGenreCategory() {
    _navigationService.navigateTo(Routes.genreCategoryView);
  }

  toArtistCategoryView() {
    _navigationService.navigateTo(Routes.artistCategoryView);
  }
}
