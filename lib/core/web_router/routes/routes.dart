import 'package:carlog/core/router/entities/dialog_route.dart';
import 'package:carlog/core/web_router/routes/shell_routes.dart';
import 'package:carlog/core/web_router/routes_constants.dart';
import 'package:carlog/features/other_features/error/presentation/pages/connection_lost_page.dart';
import 'package:carlog/features/other_features/error/presentation/pages/unknown_error_page.dart';
import 'package:carlog/features/other_features/loading/presentation/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> routes = [
  //ANCHOR - LOADING
  GoRoute(
    path: WebRoutesK.loading,
    builder: (context, state) => const LoadingPage(),
  ),

  //SECTION - APP ROUTES
  webShellRoutes,
  //!SECTION

  //SECTION - ERRORS
  //ANCHOR - UNKNOWN ERROR
  GoRoute(
    path: WebRoutesK.unknownError,
    builder: (context, state) => const UnknownErrorPage(),
  ),
  //ANCHOR - CONNECTION LOST
  GoRoute(
    path: WebRoutesK.connectionLostError,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return DialogPage(builder: (_) => const ConnectionLostPage());
    },
  ),

  //!SECTION
];
