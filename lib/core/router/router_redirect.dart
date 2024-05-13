import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/auth_features/auth/auth_bloc.dart';
import 'package:carlog/features/auth_features/tutorial/presentation/bloc/tutorial/tutorial_bloc.dart';
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
      return RoutesK.loading;
    },
    authenticated: (user) {
      if (authAccess(fullPath)) {
        return RoutesK.home;
      }
      return null;
    },
    unauthenticated: () {
      // if (tutorialState.tutorialStatus == TutorialStatus.loading) {
      //   return RoutesK.loading;
      // }
      if (tutorialState.tutorialStatus == TutorialStatus.firstEntry) {
        return RoutesK.tutorial;
      }
      if (unauthAccess(fullPath)) {
        return null;
      }

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
