import 'package:clash_flutter/screens/auth_screen.dart';
import 'package:clash_flutter/screens/avatar_screen.dart';
import 'package:clash_flutter/screens/category_screen.dart';
import 'package:clash_flutter/screens/clash_mode_screen.dart';
import 'package:clash_flutter/screens/genre_screen.dart';
import 'package:clash_flutter/screens/home_screen.dart';
import 'package:clash_flutter/screens/host_mode_screen.dart';
import 'package:clash_flutter/screens/join_clash_room.dart';
import 'package:clash_flutter/screens/user_name_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator._();

  static const authScreen = '/';
  static const categoryScreen = '/categoryScreen';
  static const clashModeScreen = '/clashModeScreen';
  static const genreScreen = '/genreScreen';
  static const userNameScreen = '/userName';
  static const joinClashRoomScreen = '/joinClashRoomScreen';
  static const avatarScreen = '/avatarScreen';
  static const homeScreen = '/homeScreen';
  static const hostModeScreen = '/hostModeScreen';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authScreen:
        return MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        );
      case categoryScreen:
        return MaterialPageRoute(
          builder: (context) => const CategoryScreen(),
        );
      case clashModeScreen:
        return MaterialPageRoute(
          builder: (context) => const ClashModeScreen(),
        );
      case genreScreen:
        return MaterialPageRoute(
          builder: (context) => const GenreScreen(),
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
      default:
        throw const FormatException('Route not Found');
    }
  }
}
