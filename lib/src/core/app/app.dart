import 'package:clash_flutter/src/core/repository/invite/invite_service.dart';
import 'package:clash_flutter/src/core/repository/repository.dart';
import 'package:clash_flutter/src/features/clash/play/armoury/set_up_armoury/set_up_armoury.dart';
import 'package:clash_flutter/src/features/features.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';


@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView,initial: true),
    MaterialRoute(page: AuthView),
    MaterialRoute(page: AvatarView),
    MaterialRoute(page: UserNameView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: WaitingRoomView),
    MaterialRoute(page: SubCategoryScreen),
    MaterialRoute(page: RoundsView),
    MaterialRoute(page: JoinRoomView),
    MaterialRoute(page: HostModeView),
    MaterialRoute(page: CreateRoomView),
    MaterialRoute(page: ClashModeScreen),
    MaterialRoute(page: CategoryView),
    MaterialRoute(page: ClashRoomView),
    MaterialRoute(page: SearchArmouryView),
    MaterialRoute(page: SetUpArmouryScreen),
    MaterialRoute(page: DeclineInviteView),
    MaterialRoute(page: ReceivedInviteScreen),
    MaterialRoute(page: InviteSentView)

  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: GameRepository),
    LazySingleton(classType: SpotifyRepository),
    LazySingleton(classType: UserRepository),
    LazySingleton(classType: SnackbarService),
    Singleton(classType: AudioService),
    LazySingleton(classType: InviteService)

  ],
  logger: StackedLogger(),
)
class AppSetup {}