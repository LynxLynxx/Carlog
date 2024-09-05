import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/extensions/gorouter_extension.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/auth_features/auth/auth_bloc.dart';
import 'package:carlog/features/auth_features/tutorial/presentation/bloc/tutorial/tutorial_bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

Future<String?> routerRedirect(
    BuildContext context, GoRouterState state) async {
  final fullPath = state.fullPath;
  final authBloc = locator<AuthBloc>();
  final tutorialState = context.read<TutorialBloc>().state;

  return authBloc.state.maybeWhen(
    orElse: () {
      FirebaseAnalytics.instance.logScreenView(
        screenClass: getRouteName(RoutesK.loading).$1,
        screenName: getRouteName(RoutesK.loading).$2,
      );
      return RoutesK.loading;
    },
    authenticated: (user) {
      if (authAccess(fullPath)) {
        FirebaseAnalytics.instance.logScreenView(
          screenClass: getRouteName(RoutesK.home).$1,
          screenName: getRouteName(RoutesK.home).$2,
        );
        return RoutesK.home;
      }

      return null;
    },
    unauthenticated: () {
      if (tutorialState.tutorialStatus == TutorialStatus.firstEntry) {
        FirebaseAnalytics.instance.logScreenView(
          screenClass: getRouteName(RoutesK.tutorial).$1,
          screenName: getRouteName(RoutesK.tutorial).$2,
        );
        return RoutesK.tutorial;
      }
      if (unauthAccess(fullPath)) {
        FirebaseAnalytics.instance.logScreenView(
          screenClass: getRouteName(fullPath ?? "/").$1,
          screenName: getRouteName(fullPath ?? "/").$2,
        );
        return null;
      }
      FirebaseAnalytics.instance.logScreenView(
        screenClass: getRouteName(RoutesK.login).$1,
        screenName: getRouteName(RoutesK.login).$2,
      );

      return RoutesK.login;
    },
  );
}

bool authAccess(String? fullPath) {
  if (fullPath == RoutesK.login ||
      fullPath == RoutesK.register ||
      fullPath == RoutesK.loading) {
    return true;
  }

  return false;
}

bool unauthAccess(String? fullPath) {
  if (fullPath == RoutesK.login ||
      fullPath == RoutesK.register ||
      fullPath == RoutesK.recoveryPassword ||
      fullPath == RoutesK.linkSent ||
      fullPath == RoutesK.connectionLostError ||
      fullPath == RoutesK.unknownError ||
      fullPath == RoutesK.loading) {
    return true;
  }
  return false;
}
