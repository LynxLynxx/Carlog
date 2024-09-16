import 'package:carlog/core/web_router/routes/routes.dart';
import 'package:carlog/core/web_router/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final webRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: WebRoutesK.home,
  routes: routes,
  debugLogDiagnostics: true,
);
