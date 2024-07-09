import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/home_app_bar.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/no_cars_found_widget.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/user_service_board_widget.dart';
import 'package:carlog/features/dashboard_features/shared/widgets/dashboard_appbar.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CarsBloc(locator())..add(const CarsEvent.getCars()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) =>
              UserAppBloc(locator())..add(const UserAppEvent.readCarFromApp()),
        ),
      ],
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomePageState();
}

class _HomePageState extends State<HomeView> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final carList = context.watch<CarsBloc>().state.carList;
    return DashboardAppbar.appbar(
      appBar: homeAppBar(
        context,
        () => setState(
          () {
            isExpanded = !isExpanded;
          },
        ),
      ),
      body: carList.isNotEmpty
          ? const UserServiceBoardWidget()
          : const NoCarsFoundWidget(),
    );
  }
}
