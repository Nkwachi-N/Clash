import 'package:clash_flutter/screens/auth_screen.dart';
import 'package:clash_flutter/screens/avatar_screen.dart';
import 'package:clash_flutter/screens/category_screen.dart';
import 'package:clash_flutter/screens/clash_mode_screen.dart';
import 'package:clash_flutter/screens/clash_room.dart';
import 'package:clash_flutter/screens/create_clash_room.dart';
import 'package:clash_flutter/screens/invite_sent_screen.dart';
import 'package:clash_flutter/screens/invite_state_screen.dart';
import 'package:clash_flutter/screens/rounds_screen.dart';
import 'package:clash_flutter/screens/sub_category_screen.dart';
import 'package:clash_flutter/screens/home_screen.dart';
import 'package:clash_flutter/screens/host_mode_screen.dart';
import 'package:clash_flutter/screens/join_clash_room.dart';
import 'package:clash_flutter/screens/user_name_screen.dart';
import 'package:clash_flutter/screens/waiting_room_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator._();

  static const authScreen = '/';
  static const categoryScreen = '/categoryScreen';
  static const waitingRoomScreen = '/waitingRoomScreen';
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
  static const inviteStateScreen = '/inviteStateScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authScreen:
        return MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        );
      case inviteStateScreen:
         return MaterialPageRoute(
          builder: (context) => const InviteStateScreen(),
        );
      case createClashRoomScreen:
        return MaterialPageRoute(
          builder: (context) => const CreateClashRoom(),
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
        return MaterialPageRoute(
          builder: (context) => const InviteSentScreen(),
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
