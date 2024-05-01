// ignore_for_file: non_constant_identifier_names

import 'package:carlog/core/router/entities/animation_go_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

StatefulShellBranch BranchGoRoute({
  required String path,
  required Widget Function(BuildContext, GoRouterState) builder,
  List<RouteBase>? routes,
  GlobalKey<NavigatorState>? navigatorKey,
}) =>
    StatefulShellBranch(routes: [
      AnimationGoRoute(
        path: path,
        builder: builder,
        routes: routes,
        navigatorKey: navigatorKey,
      ),
    ]);
