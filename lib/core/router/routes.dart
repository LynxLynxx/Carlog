import 'package:carlog/core/router/entities/animation_go_route.dart';
import 'package:carlog/core/router/entities/branch_go_route.dart';
import 'package:carlog/core/router/entities/dialog_route.dart';
import 'package:carlog/core/router/router.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/auth_features/login/presentation/pages/login_page.dart';
import 'package:carlog/features/auth_features/register/presentation/pages/register_page.dart';
import 'package:carlog/features/auth_features/reset_password/presentation/pages/link_sent_page.dart';
import 'package:carlog/features/auth_features/reset_password/presentation/pages/reset_password_page.dart';
import 'package:carlog/features/auth_features/tutorial/presentation/pages/tutorial_page.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/pages/analytics_page.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/pages/add_car_page.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/pages/cars_page.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/pages/complex_add_car_page.dart';
import 'package:carlog/features/dashboard_features/home/presentation/pages/home_page.dart';
import 'package:carlog/features/dashboard_features/settings/presentation/pages/settings_page.dart';
import 'package:carlog/features/dashboard_features/shared/widgets/dashboard_appbar.dart';
import 'package:carlog/features/other_features/error/presentation/pages/connection_lost_page.dart';
import 'package:carlog/features/other_features/error/presentation/pages/unknown_error_page.dart';
import 'package:carlog/features/other_features/loading/presentation/pages/loading_page.dart';
import 'package:carlog/features/other_features/root/presentation/pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> routes = [
  //ANCHOR - LOADING
  AnimationGoRoute(
    path: RoutesK.loading,
    transitionDuration: 800,
    builder: (context, state) => const LoadingPage(),
  ),

  //SECTION -UNAUTHORIZE
  //ANCHOR - REGISTER
  AnimationGoRoute(
    path: RoutesK.register,
    builder: (context, state) => const RegisterPage(),
  ),
  //ANCHOR - LOGIN
  AnimationGoRoute(
    path: RoutesK.login,
    builder: (context, state) => const LoginPage(),
  ),
  //ANCHOR - RECOVERY PASSWORD
  GoRoute(
    path: RoutesK.recoveryPassword,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return DialogPage(builder: (_) => const ResetPasswordPage());
    },
  ),
  GoRoute(
    path: RoutesK.linkSent,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return DialogPage(builder: (_) => const LinkSentPage());
    },
  ),
  //ANCHOR - TUTORIAL
  AnimationGoRoute(
    path: RoutesK.tutorial,
    transitionDuration: 800,
    builder: (context, state) => const TutorialPage(),
  ),
  //!SECTION

  //SECTION - AUTH
  //ANCHOR - HOME
  StatefulShellRoute.indexedStack(
    parentNavigatorKey: rootNavigatorKey,
    branches: shellBranches,
    builder: (context, state, navigationShell) =>
        RootPage(navigationShell: navigationShell),
  ),
  //!SECTION

  //SECTION - ERRORS
  //ANCHOR - UNKNOWN ERROR
  AnimationGoRoute(
    path: RoutesK.unknownError,
    transitionDuration: 500,
    builder: (context, state) => const UnknownErrorPage(),
  ),
  //ANCHOR - CONNECTION LOST
  GoRoute(
    path: RoutesK.connectionLostError,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return DialogPage(builder: (_) => const ConnectionLostPage());
    },
  ),

  //!SECTION
];

//SECTION - DASHBOARD PAGES
final List<StatefulShellBranch> shellBranches = [
  BranchGoRoute(
      path: RoutesK.home,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          // fullScreen: true,
          path: "add",
          builder: (context, state) => Scaffold(
            body: DashboardAppbar.title(
              title: "TEST",
              actions: [
                IconButton.filled(onPressed: () {}, icon: const Icon(Icons.abc))
              ],
              body: const Center(),
            ),
          ),
        ),
      ]),
  BranchGoRoute(
      path: RoutesK.cars,
      builder: (context, state) => const CarsPage(),
      routes: [
        AnimationGoRoute(
          path: "addCar",
          builder: (context, state) => const AddCarPage(),
        ),
        AnimationGoRoute(
          path: "complexManageCar",
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            return ComplexManageCarPage(
              manageCarStatus: extra['manageCarStatus'],
              carFirebaseEntity: extra['carFirebaseEntity'],
              appContext: extra['appContext'],
            );
          },
        ),
      ]),
  BranchGoRoute(
      path: RoutesK.statistics,
      builder: (context, state) => const AnalyticsPage()),
  BranchGoRoute(
    path: RoutesK.profile,
    builder: (context, state) => const SettingsPage(),
  ),
];
//!SECTION