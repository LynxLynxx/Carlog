import 'package:carlog/core/router/entities/dialog_route.dart';
import 'package:carlog/core/router/router.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/pages/analytics_page.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/pages/add_car_page.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/pages/cars_page.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/pages/manage_car_page.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/delete_car_widget.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_entity.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_enum.dart';
import 'package:carlog/features/dashboard_features/home/presentation/pages/action_details_page.dart';
import 'package:carlog/features/dashboard_features/home/presentation/pages/action_page.dart';
import 'package:carlog/features/dashboard_features/home/presentation/pages/expense_page.dart';
import 'package:carlog/features/dashboard_features/home/presentation/pages/home_page.dart';
import 'package:carlog/features/dashboard_features/home/presentation/pages/map_page.dart';
import 'package:carlog/features/dashboard_features/home/presentation/pages/milage_page.dart';
import 'package:carlog/features/other_features/root/presentation/pages/root_page.dart';
import 'package:carlog/features/settings_features/my_account/presentation/pages/my_account_page.dart';
import 'package:carlog/features/settings_features/settings/presentation/pages/settings_page.dart';
import 'package:carlog/shared/widgets/info_popup_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final dashboardNavKey = GlobalKey<NavigatorState>();
final carsNavKey = GlobalKey<NavigatorState>();
final analyticsNavKey = GlobalKey<NavigatorState>();
final settingsNavKey = GlobalKey<NavigatorState>();

final StatefulShellRoute shellRoutes = StatefulShellRoute.indexedStack(
  parentNavigatorKey: rootNavigatorKey,
  builder: (context, state, navigationShell) =>
      RootPage(navigationShell: navigationShell),
  branches: [
    dashboardBranches,
    carsBranches,
    analyticsBranches,
    settingsBranches,
  ],
);

final StatefulShellBranch dashboardBranches = StatefulShellBranch(
  navigatorKey: dashboardNavKey,
  routes: [
    GoRoute(
      path: RoutesK.home,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: "details/:id",
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            return ActionDetailsPage(
              carActionId: state.pathParameters['id'] as String,
              actionId: extra['actionId'] as String,
              carId: extra['carId'] as String,
              carActionEntity: extra['carAction'] as CarActionEntity,
            );
          },
        ),
        GoRoute(
          path: "addMilage",
          builder: (context, state) {
            return const UpdateMilagePage();
          },
        ),
        GoRoute(
          path: "addAction",
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            return ActionPage(
              appContext: extra['context'] as BuildContext,
              action: extra['actionType'] != null
                  ? extra['actionType'] as CarActionEnum
                  : CarActionEnum.service,
            );
          },
          routes: [
            GoRoute(
                path: "map",
                builder: (context, state) {
                  return MapPage(
                    appContext: state.extra as BuildContext,
                  );
                },
                routes: [
                  GoRoute(
                    path: 'mapInfo',
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      final extra = state.extra as Map<String, dynamic>;
                      return DialogPage(
                        builder: (_) => InfoPopupWidget(
                          title: extra['title'] as String,
                          body: extra['body'] as String,
                        ),
                      );
                    },
                  ),
                ]),
          ],
        ),
        GoRoute(
          path: "addExpense",
          builder: (context, state) {
            return const ExpensePage();
          },
        ),
      ],
    ),
  ],
);

final StatefulShellBranch carsBranches = StatefulShellBranch(
  navigatorKey: carsNavKey,
  routes: [
    GoRoute(
      path: RoutesK.cars,
      builder: (context, state) => const CarsPage(),
      routes: [
        GoRoute(
          path: "addCar",
          builder: (context, state) {
            final extra = state.extra as BuildContext;
            return AddCarPage(
              appContext: extra,
            );
          },
        ),
        GoRoute(
          path: "manageCar",
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>;
            return ManageCarPage(
              carFirebaseEntity: extra['carFirebaseEntity'],
              appContext: extra['appContext'],
            );
          },
          routes: [
            GoRoute(
              path: 'deleteCarConfirmation',
              pageBuilder: (BuildContext context, GoRouterState state) {
                final extra = state.extra as BuildContext;
                return DialogPage(
                  builder: (_) => DeleteCarPage(
                    appContext: extra,
                  ),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

final StatefulShellBranch analyticsBranches = StatefulShellBranch(
  navigatorKey: analyticsNavKey,
  routes: [
    GoRoute(
      path: RoutesK.statistics,
      builder: (context, state) => const AnalyticsPage(),
    ),
  ],
);

final StatefulShellBranch settingsBranches = StatefulShellBranch(
  navigatorKey: settingsNavKey,
  routes: [
    GoRoute(
      path: RoutesK.settings,
      builder: (context, state) => const SettingsPage(),
      routes: [
        GoRoute(
          path: RoutesK.myAccount.relativePath,
          builder: (context, state) => const MyAccountPage(),
        )
      ],
    ),
  ],
);
