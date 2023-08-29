import 'package:clash_flutter/src/core/services/service.dart';
import 'package:clash_flutter/src/features/clash/play/armoury/set_up_armoury/set_up_armoury.dart';
import 'package:clash_flutter/src/features/features.dart';
import 'package:clash_flutter/src/features/home/profile/invite_friends/invite_friends_view.dart';
import 'package:clash_flutter/src/features/home/profile/views/profile_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';


@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView,initial: true),
    MaterialRoute(page: AuthView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: GenreWaitingRoomView),
    MaterialRoute(page: ArtistCategoryView),
    MaterialRoute(page: GenreCategoryView),
    MaterialRoute(page: RoundsView),
    MaterialRoute(page: JoinRoomView),
    MaterialRoute(page: HostModeView),
    MaterialRoute(page: CreateRoomView),
    MaterialRoute(page: ClashModeScreen),
    MaterialRoute(page: CategoryView),
    MaterialRoute(page: ClashRoomView),
    MaterialRoute(page: SearchArmouryView),
    MaterialRoute(page: SetUpArmouryScreen),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: InviteFriendsView),
  ],
  dependencies: [
    LazySingleton(classType: GameService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SpotifyService),
    LazySingleton(classType: SnackbarService),
    Singleton(classType: AudioService),
    LazySingleton(classType: FireBaseService),
    LazySingleton(classType: UserDatabaseService),
    LazySingleton(classType: NotificationService),
    LazySingleton(classType: StorageService)

  ],
  logger: StackedLogger(),
)
class AppSetup {}