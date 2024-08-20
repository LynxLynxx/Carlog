import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/service/service_bloc.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/home_app_bar.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/no_cars_found_widget.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/timeline/user_service_board_widget.dart';
import 'package:carlog/features/dashboard_features/shared/widgets/dashboard_appbar.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

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
        BlocProvider(create: (context) => ServiceBloc(locator())),
        BlocProvider(
          lazy: false,
          create: (context) => UserAppBloc(
            locator(),
            context.read<ServiceBloc>(),
          )..add(const UserAppEvent.readCarFromApp()),
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
    return DashboardAppbar.appbar(
      appBar: homeAppBar(
        context,
      ),
      body: BlocBuilder<CarsBloc, CarsState>(
        builder: (context, state) {
          if (state.status.isInProgress || state.status.isInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          return state.carList.isNotEmpty
              ? const UserServiceBoardWidget()
              : const NoCarsFoundWidget();
        },
      ),
    );
  }
}
