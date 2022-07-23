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
  static const String tabView = '/tab-view';
  static const String nubianDAppView = '/nubian-dapp-view';
  static const String signTransactionView = '/sign-transaction-view';
  static const String networkView = '/network-view';
  static const String splashScreenView = '/splash-screen-view';
  static const String welcomeView = '/welcome-view';
  static const all = <String>{
    startUpView,
    tabView,
    nubianDAppView,
    signTransactionView,
    networkView,
    splashScreenView,
    welcomeView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.tabView, page: TabView),
    RouteDef(Routes.nubianDAppView, page: NubianDAppView),
    RouteDef(Routes.signTransactionView, page: SignTransactionView),
    RouteDef(Routes.networkView, page: NetworkView),
    RouteDef(Routes.splashScreenView, page: SplashScreenView),
    RouteDef(Routes.welcomeView, page: WelcomeView),
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
    TabView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const TabView(),
        settings: data,
      );
    },
    NubianDAppView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NubianDAppView(),
        settings: data,
      );
    },
    SignTransactionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SignTransactionView(),
        settings: data,
      );
    },
    NetworkView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NetworkView(),
        settings: data,
      );
    },
    SplashScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashScreenView(),
        settings: data,
      );
    },
    WelcomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WelcomeView(),
        settings: data,
      );
    },
  };
}
