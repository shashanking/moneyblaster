// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:ff_moneyblaster/feautres/auth/presentation/loading_screen.dart'
    as _i4;
import 'package:ff_moneyblaster/feautres/auth/presentation/login_screen.dart'
    as _i5;
import 'package:ff_moneyblaster/feautres/auth/presentation/signup_screen.dart'
    as _i10;
import 'package:ff_moneyblaster/feautres/base/presentation/base_screen.dart'
    as _i1;
import 'package:ff_moneyblaster/feautres/home/domain/tournament.dart' as _i15;
import 'package:ff_moneyblaster/feautres/home/presentation/home_screen.dart'
    as _i2;
import 'package:ff_moneyblaster/feautres/home/presentation/result_screen.dart'
    as _i9;
import 'package:ff_moneyblaster/feautres/landing/presentation/onboarding_screen.dart'
    as _i7;
import 'package:ff_moneyblaster/feautres/leaderboard/presentation/leaderboard_screen.dart'
    as _i3;
import 'package:ff_moneyblaster/feautres/notification/presentation/notification_screen.dart'
    as _i6;
import 'package:ff_moneyblaster/feautres/profile/presentation/profile_screen.dart'
    as _i8;
import 'package:ff_moneyblaster/feautres/splash/splash.dart' as _i11;
import 'package:ff_moneyblaster/feautres/wallet/presentation/wallet_screen.dart'
    as _i12;
import 'package:flutter/material.dart' as _i14;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    BaseRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BasePage(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LeaderboardScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LeaderbaordScreen(),
      );
    },
    LoadingScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoadingScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginScreen(),
      );
    },
    NotificationScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.NotificationScreen(),
      );
    },
    OnboardingScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.OnboardingScreen(),
      );
    },
    ProfileScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileScreen(),
      );
    },
    ResultScreen.name: (routeData) {
      final args = routeData.argsAs<ResultScreenArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ResultdScreen(
          key: args.key,
          title: args.title,
          result: args.result,
        ),
      );
    },
    SignupScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SignupScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SplashScreen(),
      );
    },
    WalletScreen.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.WalletScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.BasePage]
class BaseRoute extends _i13.PageRouteInfo<void> {
  const BaseRoute({List<_i13.PageRouteInfo>? children})
      : super(
          BaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreen extends _i13.PageRouteInfo<void> {
  const HomeScreen({List<_i13.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LeaderbaordScreen]
class LeaderboardScreen extends _i13.PageRouteInfo<void> {
  const LeaderboardScreen({List<_i13.PageRouteInfo>? children})
      : super(
          LeaderboardScreen.name,
          initialChildren: children,
        );

  static const String name = 'LeaderboardScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoadingScreen]
class LoadingScreen extends _i13.PageRouteInfo<void> {
  const LoadingScreen({List<_i13.PageRouteInfo>? children})
      : super(
          LoadingScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoadingScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginScreen]
class LoginScreen extends _i13.PageRouteInfo<void> {
  const LoginScreen({List<_i13.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.NotificationScreen]
class NotificationScreen extends _i13.PageRouteInfo<void> {
  const NotificationScreen({List<_i13.PageRouteInfo>? children})
      : super(
          NotificationScreen.name,
          initialChildren: children,
        );

  static const String name = 'NotificationScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OnboardingScreen]
class OnboardingScreen extends _i13.PageRouteInfo<void> {
  const OnboardingScreen({List<_i13.PageRouteInfo>? children})
      : super(
          OnboardingScreen.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileScreen extends _i13.PageRouteInfo<void> {
  const ProfileScreen({List<_i13.PageRouteInfo>? children})
      : super(
          ProfileScreen.name,
          initialChildren: children,
        );

  static const String name = 'ProfileScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ResultdScreen]
class ResultScreen extends _i13.PageRouteInfo<ResultScreenArgs> {
  ResultScreen({
    _i14.Key? key,
    required String title,
    required List<_i15.ResultModel?>? result,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ResultScreen.name,
          args: ResultScreenArgs(
            key: key,
            title: title,
            result: result,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultScreen';

  static const _i13.PageInfo<ResultScreenArgs> page =
      _i13.PageInfo<ResultScreenArgs>(name);
}

class ResultScreenArgs {
  const ResultScreenArgs({
    this.key,
    required this.title,
    required this.result,
  });

  final _i14.Key? key;

  final String title;

  final List<_i15.ResultModel?>? result;

  @override
  String toString() {
    return 'ResultScreenArgs{key: $key, title: $title, result: $result}';
  }
}

/// generated route for
/// [_i10.SignupScreen]
class SignupScreen extends _i13.PageRouteInfo<void> {
  const SignupScreen({List<_i13.PageRouteInfo>? children})
      : super(
          SignupScreen.name,
          initialChildren: children,
        );

  static const String name = 'SignupScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SplashScreen]
class SplashScreen extends _i13.PageRouteInfo<void> {
  const SplashScreen({List<_i13.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.WalletScreen]
class WalletScreen extends _i13.PageRouteInfo<void> {
  const WalletScreen({List<_i13.PageRouteInfo>? children})
      : super(
          WalletScreen.name,
          initialChildren: children,
        );

  static const String name = 'WalletScreen';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
