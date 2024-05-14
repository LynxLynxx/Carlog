import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/router/entities/animation_go_route.dart';
import 'package:carlog/core/router/entities/branch_go_route.dart';
import 'package:carlog/core/router/entities/dialog_route.dart';
import 'package:carlog/core/router/router.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/auth_features/auth/auth_bloc.dart';
import 'package:carlog/features/auth_features/login/presentation/pages/login_page.dart';
import 'package:carlog/features/auth_features/register/presentation/pages/register_page.dart';
import 'package:carlog/features/auth_features/reset_password/presentation/pages/link_sent_page.dart';
import 'package:carlog/features/auth_features/reset_password/presentation/pages/reset_password_page.dart';
import 'package:carlog/features/auth_features/tutorial/presentation/pages/tutorial_page.dart';
import 'package:carlog/features/other_features/error/presentation/pages/connection_lost_page.dart';
import 'package:carlog/features/other_features/error/presentation/pages/unknown_error_page.dart';
import 'package:carlog/features/other_features/loading/presentation/pages/loading_page.dart';
import 'package:carlog/features/other_features/root/presentation/pages/root_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                        onPressed: () => locator<AuthBloc>()
                            .add(const AuthEvent.appLogoutRequested()),
                        child: const Text("LOGOUT"))
                  ],
                ),
                SliverFillRemaining(
                  child: Center(
                    child: TextButton(
                      child: Column(
                        children: [
                          const Text("ASD"),
                          Text(FirebaseAuth.instance.currentUser?.displayName ??
                              "NO NAME"),
                          Text(FirebaseAuth.instance.currentUser?.uid ??
                              "NO UID"),
                        ],
                      ),
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
    path: RoutesK.cars,
    builder: (context, state) => const Scaffold(
      body: Center(
        child: Text("Cars"),
      ),
    ),
  ),
  BranchGoRoute(
    path: RoutesK.statistics,
    builder: (context, state) => const Scaffold(
      body: Center(
        child: Text("Charts"),
      ),
    ),
  ),
  BranchGoRoute(
    path: RoutesK.profile,
    builder: (context, state) => const Scaffold(
      body: Center(
        child: Text("Profile"),
      ),
    ),
  ),
];
