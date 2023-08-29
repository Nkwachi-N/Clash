// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clash_flutter/src/features/clash/play/armoury/set_up_armoury/set_up_armoury.dart'
    as _i3;
import 'package:clash_flutter/src/features/features.dart' as _i2;
import 'package:clash_flutter/src/features/home/profile/invite_friends/invite_friends_view.dart'
    as _i5;
import 'package:clash_flutter/src/features/home/profile/views/profile_view.dart'
    as _i4;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const startUpView = '/';

  static const authView = '/auth-view';

  static const homeView = '/home-view';

  static const genreWaitingRoomView = '/genre-waiting-room-view';

  static const artistCategoryView = '/artist-category-view';

  static const genreCategoryView = '/genre-category-view';

  static const roundsView = '/rounds-view';

  static const joinRoomView = '/join-room-view';

  static const hostModeView = '/host-mode-view';

  static const createRoomView = '/create-room-view';

  static const clashModeScreen = '/clash-mode-screen';

  static const categoryView = '/category-view';

  static const clashRoomView = '/clash-room-view';

  static const searchArmouryView = '/search-armoury-view';

  static const setUpArmouryScreen = '/set-up-armoury-screen';

  static const profileView = '/profile-view';

  static const inviteFriendsView = '/invite-friends-view';

  static const all = <String>{
    startUpView,
    authView,
    homeView,
    genreWaitingRoomView,
    artistCategoryView,
    genreCategoryView,
    roundsView,
    joinRoomView,
    hostModeView,
    createRoomView,
    clashModeScreen,
    categoryView,
    clashRoomView,
    searchArmouryView,
    setUpArmouryScreen,
    profileView,
    inviteFriendsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startUpView,
      page: _i2.StartUpView,
    ),
    _i1.RouteDef(
      Routes.authView,
      page: _i2.AuthView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.genreWaitingRoomView,
      page: _i2.GenreWaitingRoomView,
    ),
    _i1.RouteDef(
      Routes.artistCategoryView,
      page: _i2.ArtistCategoryView,
    ),
    _i1.RouteDef(
      Routes.genreCategoryView,
      page: _i2.GenreCategoryView,
    ),
    _i1.RouteDef(
      Routes.roundsView,
      page: _i2.RoundsView,
    ),
    _i1.RouteDef(
      Routes.joinRoomView,
      page: _i2.JoinRoomView,
    ),
    _i1.RouteDef(
      Routes.hostModeView,
      page: _i2.HostModeView,
    ),
    _i1.RouteDef(
      Routes.createRoomView,
      page: _i2.CreateRoomView,
    ),
    _i1.RouteDef(
      Routes.clashModeScreen,
      page: _i2.ClashModeScreen,
    ),
    _i1.RouteDef(
      Routes.categoryView,
      page: _i2.CategoryView,
    ),
    _i1.RouteDef(
      Routes.clashRoomView,
      page: _i2.ClashRoomView,
    ),
    _i1.RouteDef(
      Routes.searchArmouryView,
      page: _i2.SearchArmouryView,
    ),
    _i1.RouteDef(
      Routes.setUpArmouryScreen,
      page: _i3.SetUpArmouryScreen,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i4.ProfileView,
    ),
    _i1.RouteDef(
      Routes.inviteFriendsView,
      page: _i5.InviteFriendsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartUpView(),
        settings: data,
      );
    },
    _i2.AuthView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.AuthView(),
        settings: data,
      );
    },
    _i2.HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i2.GenreWaitingRoomView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.GenreWaitingRoomView(),
        settings: data,
      );
    },
    _i2.ArtistCategoryView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.ArtistCategoryView(),
        settings: data,
      );
    },
    _i2.GenreCategoryView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.GenreCategoryView(),
        settings: data,
      );
    },
    _i2.RoundsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.RoundsView(),
        settings: data,
      );
    },
    _i2.JoinRoomView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.JoinRoomView(),
        settings: data,
      );
    },
    _i2.HostModeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HostModeView(),
        settings: data,
      );
    },
    _i2.CreateRoomView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.CreateRoomView(),
        settings: data,
      );
    },
    _i2.ClashModeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.ClashModeScreen(),
        settings: data,
      );
    },
    _i2.CategoryView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.CategoryView(),
        settings: data,
      );
    },
    _i2.ClashRoomView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.ClashRoomView(),
        settings: data,
      );
    },
    _i2.SearchArmouryView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SearchArmouryView(),
        settings: data,
      );
    },
    _i3.SetUpArmouryScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.SetUpArmouryScreen(),
        settings: data,
      );
    },
    _i4.ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.ProfileView(),
        settings: data,
      );
    },
    _i5.InviteFriendsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.InviteFriendsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToStartUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAuthView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.authView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGenreWaitingRoomView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.genreWaitingRoomView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToArtistCategoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.artistCategoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGenreCategoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.genreCategoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRoundsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.roundsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToJoinRoomView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.joinRoomView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHostModeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.hostModeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateRoomView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createRoomView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToClashModeScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.clashModeScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCategoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.categoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToClashRoomView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.clashRoomView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchArmouryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.searchArmouryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSetUpArmouryScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.setUpArmouryScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInviteFriendsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.inviteFriendsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
