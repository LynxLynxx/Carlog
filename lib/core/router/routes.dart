import 'package:carlog/core/router/entities/animation_go_route.dart';
import 'package:carlog/core/router/entities/branch_go_route.dart';
import 'package:carlog/core/router/router.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/auth_features/login/presentation/pages/login_page.dart';
import 'package:carlog/features/auth_features/register/presentation/pages/register_page.dart';
import 'package:carlog/features/other_features/loading/presentation/pages/loading_page.dart';
import 'package:carlog/root_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> routes = [
  //ANCHOR - LOADING
  AnimationGoRoute(
    path: RoutesK.loading,
    builder: (context, state) => const LoadingPage(),
  ),

  //SECTION -UNAUTHORIZE
  //ANCHOR - REGISTER
  GoRoute(
    path: RoutesK.register,
    builder: (context, state) => const RegisterPage(),
  ),
  //ANCHOR - LOGIN
  AnimationGoRoute(
    path: RoutesK.login,
    builder: (context, state) => const LoginPage(),
  ),
  //ANCHOR - RECOVERY PASSWORD

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
];

final List<StatefulShellBranch> shellBranches = [
  BranchGoRoute(
      path: RoutesK.home,
      builder: (context, state) => Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar.medium(
                  title: const Text(
                    "HOME",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 30,
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => context.go(RoutesK.login),
                        child: const Text("LOGOUT"))
                  ],
                ),
                SliverFillRemaining(
                  child: Center(
                    child: TextButton(
                      child: const Text("ASD"),
                      onPressed: () => context.push("/add"),
                    ),
                  ),
                )
              ],
            ),
          ),
      routes: [
        GoRoute(
          // fullScreen: true,
          path: "add",
          builder: (context, state) => const Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar.medium(
                  title: Text(
                    "ADD",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 30,
                    ),
                  ),
                  actions: [
                    Text("  ADD "),
                  ],
                ),
                SliverFillRemaining(
                  child: Center(
                    child: Text("ADD"),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
  BranchGoRoute(
    path: RoutesK.settings,
    builder: (context, state) => const Scaffold(),
  )
];
