// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../features/features.dart';

class Routes {
  static const String startUpView = '/';
  static const String authView = '/auth-view';
  static const String avatarView = '/avatar-view';
  static const String userNameView = '/user-name-view';
  static const all = <String>{
    startUpView,
    authView,
    avatarView,
    userNameView,
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
  };
}
