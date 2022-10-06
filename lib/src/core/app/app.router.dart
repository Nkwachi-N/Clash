// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../features/clash/play/armoury/set_up_armoury/set_up_armoury.dart';
import '../../features/features.dart';
import '../../features/home/profile/invite_friends/invite_friends_view.dart';
import '../../features/home/profile/views/profile_view.dart';
import '../../features/user_name/views/user_name_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String authView = '/auth-view';
  static const String homeView = '/home-view';
  static const String waitingRoomView = '/waiting-room-view';
  static const String subCategoryScreen = '/sub-category-screen';
  static const String roundsView = '/rounds-view';
  static const String joinRoomView = '/join-room-view';
  static const String hostModeView = '/host-mode-view';
  static const String createRoomView = '/create-room-view';
  static const String clashModeScreen = '/clash-mode-screen';
  static const String categoryView = '/category-view';
  static const String clashRoomView = '/clash-room-view';
  static const String searchArmouryView = '/search-armoury-view';
  static const String setUpArmouryScreen = '/set-up-armoury-screen';
  static const String declineInviteView = '/decline-invite-view';
  static const String receivedInviteScreen = '/received-invite-screen';
  static const String inviteSentView = '/invite-sent-view';
  static const String profileView = '/profile-view';
  static const String inviteFriendsView = '/invite-friends-view';
  static const String userNameView = '/user-name-view';
  static const all = <String>{
    startUpView,
    authView,
    homeView,
    waitingRoomView,
    subCategoryScreen,
    roundsView,
    joinRoomView,
    hostModeView,
    createRoomView,
    clashModeScreen,
    categoryView,
    clashRoomView,
    searchArmouryView,
    setUpArmouryScreen,
    declineInviteView,
    receivedInviteScreen,
    inviteSentView,
    profileView,
    inviteFriendsView,
    userNameView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.authView, page: AuthView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.waitingRoomView, page: WaitingRoomView),
    RouteDef(Routes.subCategoryScreen, page: SubCategoryScreen),
    RouteDef(Routes.roundsView, page: RoundsView),
    RouteDef(Routes.joinRoomView, page: JoinRoomView),
    RouteDef(Routes.hostModeView, page: HostModeView),
    RouteDef(Routes.createRoomView, page: CreateRoomView),
    RouteDef(Routes.clashModeScreen, page: ClashModeScreen),
    RouteDef(Routes.categoryView, page: CategoryView),
    RouteDef(Routes.clashRoomView, page: ClashRoomView),
    RouteDef(Routes.searchArmouryView, page: SearchArmouryView),
    RouteDef(Routes.setUpArmouryScreen, page: SetUpArmouryScreen),
    RouteDef(Routes.declineInviteView, page: DeclineInviteView),
    RouteDef(Routes.receivedInviteScreen, page: ReceivedInviteScreen),
    RouteDef(Routes.inviteSentView, page: InviteSentView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.inviteFriendsView, page: InviteFriendsView),
    RouteDef(Routes.userNameView, page: UserNameView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    AuthView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AuthView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    WaitingRoomView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WaitingRoomView(),
        settings: data,
      );
    },
    SubCategoryScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SubCategoryScreen(),
        settings: data,
      );
    },
    RoundsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const RoundsView(),
        settings: data,
      );
    },
    JoinRoomView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const JoinRoomView(),
        settings: data,
      );
    },
    HostModeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HostModeView(),
        settings: data,
      );
    },
    CreateRoomView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CreateRoomView(),
        settings: data,
      );
    },
    ClashModeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ClashModeScreen(),
        settings: data,
      );
    },
    CategoryView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CategoryView(),
        settings: data,
      );
    },
    ClashRoomView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ClashRoomView(),
        settings: data,
      );
    },
    SearchArmouryView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SearchArmouryView(),
        settings: data,
      );
    },
    SetUpArmouryScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SetUpArmouryScreen(),
        settings: data,
      );
    },
    DeclineInviteView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DeclineInviteView(),
        settings: data,
      );
    },
    ReceivedInviteScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ReceivedInviteScreen(),
        settings: data,
      );
    },
    InviteSentView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const InviteSentView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ProfileView(),
        settings: data,
      );
    },
    InviteFriendsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const InviteFriendsView(),
        settings: data,
      );
    },
    UserNameView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UserNameView(),
        settings: data,
      );
    },
  };
}
