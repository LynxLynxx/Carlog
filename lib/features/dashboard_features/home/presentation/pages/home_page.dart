import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/home_app_bar.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/no_cars_found_widget.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/timeline/user_service_board_widget.dart';
import 'package:carlog/features/dashboard_features/shared/widgets/dashboard_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
