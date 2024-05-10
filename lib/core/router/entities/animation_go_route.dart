// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRoute AnimationGoRoute(
        {bool? fullScreen,
        int? transitionDuration,
        required String path,
        required Widget Function(BuildContext, GoRouterState) builder,
        Function(BuildContext context, GoRouterState state)? redirect,
        List<RouteBase>? routes,
        GlobalKey<NavigatorState>? navigatorKey}) =>
    GoRoute(
        path: path,
        pageBuilder: (context, state) => navigateToWithAnimation<void>(
              state,
              builder(context, state),
              fullScreen,
              transitionDuration,
            ),
        redirect: (context, state) {
          if (redirect != null) {
            return redirect(context, state);
          }
          return null;
        },
        parentNavigatorKey: navigatorKey,
        routes: routes ?? const <RouteBase>[]);

navigateToWithAnimation<T>(
  GoRouterState state,
  Widget widget,
  bool? fullScreen,
  int? transitionDuration,
) =>
    CustomTransitionPage(
        key: state.pageKey,
        child: widget,
        fullscreenDialog: fullScreen ?? false,
        transitionDuration: Duration(milliseconds: transitionDuration ?? 300),
        transitionsBuilder: (_, animation, __, child) => FadeTransition(
              opacity: animation,
              child: child,
            ));
