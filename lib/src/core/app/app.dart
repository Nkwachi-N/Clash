import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:clash_flutter/src/features/features.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';


@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView,initial: true),
    MaterialRoute(page: AuthView),
    MaterialRoute(page: AvatarView),
    MaterialRoute(page: UserNameView)

  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: GameRepository),
    LazySingleton(classType: SpotifyRepository),
    LazySingleton(classType: UserRepository)

  ],
  logger: StackedLogger(),
)
class AppSetup {}