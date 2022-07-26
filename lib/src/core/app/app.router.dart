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

class Routes {
  static const String startUpView = '/';
  static const String authView = '/auth-view';
  static const String avatarView = '/avatar-view';
  static const String userNameView = '/user-name-view';
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
  static const all = <String>{
    startUpView,
    authView,
    avatarView,
    userNameView,
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
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.authView, page: AuthView),
    RouteDef(Routes.avatarView, page: AvatarView),
    RouteDef(Routes.userNameView, page: UserNameView),
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
    AvatarView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AvatarView(),
        settings: data,
      );
    },
    UserNameView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UserNameView(),
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
  };
}
