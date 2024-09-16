import 'package:carlog/core/web_router/router.dart';
import 'package:carlog/core/web_router/routes_constants.dart';
import 'package:carlog/web_features/web_contact/presentation/pages/web_contact_page.dart';
import 'package:carlog/web_features/web_home/presentation/pages/web_home_page.dart';
import 'package:carlog/web_features/web_request_feature/presentation/pages/web_request_feature_page.dart';
import 'package:carlog/web_features/web_root/presentation/pages/web_root_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final homeNavKey = GlobalKey<NavigatorState>();
final contactNavKey = GlobalKey<NavigatorState>();
final requestFeatureNavKey = GlobalKey<NavigatorState>();

final StatefulShellRoute webShellRoutes = StatefulShellRoute.indexedStack(
  parentNavigatorKey: rootNavigatorKey,
  builder: (context, state, navigationShell) =>
      WebRootPage(navigationShell: navigationShell),
  branches: [
    contactBranches,
    homeBranches,
    requestFeatureBranches,
  ],
);

final StatefulShellBranch homeBranches = StatefulShellBranch(
  navigatorKey: homeNavKey,
  routes: [
    GoRoute(
      path: WebRoutesK.home,
      builder: (context, state) => const WebHomePage(),
    ),
  ],
);

final StatefulShellBranch requestFeatureBranches = StatefulShellBranch(
  navigatorKey: requestFeatureNavKey,
  routes: [
    GoRoute(
      path: WebRoutesK.suggest,
      builder: (context, state) => const WebRequestFeaturePage(),
    ),
  ],
);

final StatefulShellBranch contactBranches = StatefulShellBranch(
  navigatorKey: contactNavKey,
  routes: [
    GoRoute(
      path: WebRoutesK.contact,
      builder: (context, state) => const WebContactPage(),
    ),
  ],
);
