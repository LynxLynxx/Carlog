import 'package:carlog/core/router/router_redirect.dart';
import 'package:carlog/core/router/routes/routes.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: RoutesK.home,
  routes: routes,
  redirect: (context, state) async => await routerRedirect(context, state),
  debugLogDiagnostics: true,
);
