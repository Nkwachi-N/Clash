// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';

import '../services/audio/audio_service.dart';
import '../services/database/user_database/user_database_service.dart';
import '../services/firebase/firebase_service.dart';
import '../services/game/game_service.dart';
import '../services/notification/notification_service.dart';
import '../services/spotify/spotify_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => GameService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SpotifyService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerSingleton(AudioService());
  locator.registerLazySingleton(() => FireBaseService());
  locator.registerLazySingleton(() => UserDatabaseService());
  locator.registerLazySingleton(() => NotificationService());
}
