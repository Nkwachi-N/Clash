import 'package:clash_flutter/screens/armoury/armoury_search.dart';
import 'package:clash_flutter/screens/auth_screen.dart';
import 'package:clash_flutter/screens/avatar_screen.dart';
import 'package:clash_flutter/screens/category_screen.dart';
import 'package:clash_flutter/screens/clash_mode_screen.dart';
import 'package:clash_flutter/screens/clash_room.dart';
import 'package:clash_flutter/screens/create_clash_room.dart';
import 'package:clash_flutter/screens/invite/invite_declined_screen.dart';
import 'package:clash_flutter/screens/invite/invite_sent_screen.dart';
import 'package:clash_flutter/screens/invite/received_invite_screen.dart';
import 'package:clash_flutter/screens/rounds_screen.dart';
import 'package:clash_flutter/screens/set_up_armoury_screen.dart';
import 'package:clash_flutter/screens/sub_category_screen.dart';
import 'package:clash_flutter/screens/home_screen.dart';
import 'package:clash_flutter/screens/host_mode_screen.dart';
import 'package:clash_flutter/screens/join_clash_room.dart';
import 'package:clash_flutter/screens/success_screen.dart';
import 'package:clash_flutter/screens/user_name_screen.dart';
import 'package:clash_flutter/screens/waiting_room_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator._();

  static const authScreen = '/';
  static const categoryScreen = '/categoryScreen';
  static const waitingRoomScreen = '/waitingRoomScreen';
  static const inviteDeclinedScreen = '/inviteDeclinedScreen';
  static const clashModeScreen = '/clashModeScreen';
  static const clashRoomScreen = '/clashRoomScreen';
  static const subCategoryScreen = '/genreScreen';
  static const userNameScreen = '/userNameScreen';
  static const joinClashRoomScreen = '/joinClashRoomScreen';
  static const avatarScreen = '/avatarScreen';
  static const homeScreen = '/homeScreen';
  static const hostModeScreen = '/hostModeScreen';
  static const roundsScreen = '/roundsScreen';
  static const inviteSentScreen = '/inviteSentScreen';
  static const createClashRoomScreen = '/createClashRoomScreen';
  static const receivedInviteScreen = '/receivedInviteScreen';
  static const successScreen = '/successScreen';
  static const setUpArmouryScreen = '/setUpArmouryScreen';
  static const armourySearchScreen = '/armourySearchScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authScreen:
        return MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        );
      case setUpArmouryScreen:
        return MaterialPageRoute(
          builder: (context) => const SetUpArmouryScreen(),
        );
      case armourySearchScreen:
        return MaterialPageRoute(
          builder: (context) => const ArmourySearch(),
        );
      case successScreen:
        final args = settings.arguments as SuccessScreenArgs;
        return MaterialPageRoute(
          builder: (context) => SuccessScreen(args: args),
        );
      case receivedInviteScreen:
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ReceivedInviteScreen(
            userName: args,
          ),
        );

      case createClashRoomScreen:
        return MaterialPageRoute(
          builder: (context) => const CreateClashRoom(),
        );
      case inviteDeclinedScreen:
        final args = settings.arguments as String;

        return MaterialPageRoute(
          builder: (context) => InviteDeclinedScreen(
            username: args,
          ),
        );
      case clashRoomScreen:
        return MaterialPageRoute(
          builder: (context) => const ClashRoomScreen(),
        );
      case categoryScreen:
        return MaterialPageRoute(
          builder: (context) => const CategoryScreen(),
        );
      case clashModeScreen:
        return MaterialPageRoute(
          builder: (context) => const ClashModeScreen(),
        );
      case waitingRoomScreen:
        return MaterialPageRoute(
          builder: (context) => const WaitingRoomScreen(),
        );
      case subCategoryScreen:
        return MaterialPageRoute(
          builder: (context) => const SubCategoryScreen(),
        );
      case inviteSentScreen:
        final args = settings.arguments as String;

        return MaterialPageRoute(
          builder: (context) => InviteSentScreen(
            username: args,
          ),
        );
      case userNameScreen:
        return MaterialPageRoute(
          builder: (context) => const UserNameScreen(),
        );
      case joinClashRoomScreen:
        return MaterialPageRoute(
          builder: (context) => const JoinClashRoom(),
        );
      case avatarScreen:
        return MaterialPageRoute(
          builder: (context) => const AvatarScreen(),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case hostModeScreen:
        return MaterialPageRoute(
          builder: (context) => const HostModeScreen(),
        );
      case roundsScreen:
        return MaterialPageRoute(
          builder: (context) => const RoundsScreen(),
        );
      default:
        throw const FormatException('Route not Found');
    }
  }
}
