import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/bloc/analytics_bloc.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:carlog/shared/widgets/carlog_car_appbar.dart';
import 'package:carlog/shared/widgets/carlog_loader.dart';
import 'package:carlog/shared/widgets/carlog_scaffold.dart';
import 'package:carlog/shared/widgets/error_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnalyticsBloc(locator(), context.read<UserAppBloc>())
        ..add(const AnalyticsEvent.getExpenses()),
      child: const AnalyticsView(),
    );
  }
}

class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CarlogScaffold.appbar(
        appBar: carlogCarAppBar(
          context,
        ),
        body: BlocBuilder<AnalyticsBloc, AnalyticsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const CarlogLoader(),
              loading: () => const CarlogLoader(),
              data: (carExpenseList) => _buildBody(carExpenseList),
              failure: (failure) => ErrorIndicator(failure: failure),
            );
          },
        ));
  }

  _buildBody(List<CarExpenseEntity> carExpenseList) => ListView.builder(
        shrinkWrap: true,
        itemCount: carExpenseList.length,
        itemBuilder: (context, index) => Text(carExpenseList[index].toString()),
      );
}
