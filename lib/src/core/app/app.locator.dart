// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../repository/invite/invite_service.dart';
import '../repository/repository.dart';

final locator = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => GameRepository());
  locator.registerLazySingleton(() => SpotifyRepository());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerSingleton(AudioService());
  locator.registerLazySingleton(() => InviteService());
}
