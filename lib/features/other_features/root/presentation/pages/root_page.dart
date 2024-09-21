import 'package:carlog/core/constants/snackbars.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/extensions/gorouter_extension.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/services/app_lifecycle_service.dart';
import 'package:carlog/core/services/appopen_service.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/bloc/analytics_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/action/action_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/other_features/error/presentation/cubit/network_connection_cubit.dart';
import 'package:carlog/features/other_features/root/presentation/widgets/custom_bottom_navigation_bar_widget.dart';
import 'package:carlog/features/other_features/root/presentation/widgets/custom_floating_button_widget.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:carlog/shared/push_notifications/bloc/fcm/fcm_bloc.dart';
import 'package:carlog/shared/push_notifications/bloc/fcm_token/fcm_token_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RootPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const RootPage({super.key, required this.navigationShell});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late AppLifecycleService appLifecycleService;

  @override
  void initState() {
    super.initState();

    AppOpenAdManager appOpenAdManager = AppOpenAdManager()..loadAd();
    appLifecycleService =
        AppLifecycleService(appOpenAdManager: appOpenAdManager);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CarsBloc(locator())..add(const CarsEvent.getCars()),
        ),
        BlocProvider(
          create: (context) => ActionBloc(locator()),
        ),
        BlocProvider(
          create: (context) => AnalyticsBloc(
            locator(),
          ),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => UserAppBloc(
            locator(),
            context.read<ActionBloc>(),
            context.read<AnalyticsBloc>(),
            context.read<CarsBloc>(),
          ),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => FcmTokenBloc(),
        ),
      ],
      child: RootView(navigationShell: widget.navigationShell),
    );
  }
}

class RootView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const RootView({super.key, required this.navigationShell});

  void onTap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  getMainPages() {
    switch (navigationShell.shellRouteContext.routerState.fullPath) {
      case RoutesK.home:
      case RoutesK.cars:
      case RoutesK.statistics:
      case RoutesK.settings:
        return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final connectionStatus =
        context.watch<NetworkConnectionCubit>().state.connectionStatus;
    return BlocListener<FcmBloc, FcmState>(
      listener: (context, state) {
        state.whenOrNull(
          showNotification: (pushNotification) {
            SnackbarsK.infoSnackbar(pushNotification.description).show(context);
          },
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            navigationShell,
            connectionStatus == ConnectionStatus.disconnected
                ? Positioned(
                    top: 50,
                    left: 20,
                    child: GestureDetector(
                      onTap: () => context.push(RoutesK.connectionLostError),
                      child: CircleAvatar(
                        backgroundColor: context.errorContainer,
                        child: const Icon(Icons.wifi_off),
                      ),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GoRouter.of(context).showNavBar
            ? CustomFloatingButtonWidget()
            : null,
        bottomNavigationBar: GoRouter.of(context).showNavBar
            ? CustomBottomNavigationBarWidget(navigationShell: navigationShell)
            : null,
      ),
    );
  }
}
