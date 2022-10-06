// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/invite/invite_service.dart';
import '../services/service.dart';

final locator = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => GameService());
  locator.registerLazySingleton(() => SpotifyService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerSingleton(AudioService());
  locator.registerLazySingleton(() => InviteService());
  locator.registerLazySingleton(() => FireBaseService());
  locator.registerLazySingleton(() => UserDatabaseService());
}
