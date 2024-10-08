import 'dart:developer';

import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/bloc/analytics_bloc.dart';
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
    return const AnalyticsView();
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
            log("-------${state.toString()}");
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
        itemBuilder: (context, index) => Card(
            child: Column(
          children: [
            if (carExpenseList[index].attachmentPath != "")
              Image.network(carExpenseList[index].attachmentPath!),
            Text(carExpenseList[index].toString()),
          ],
        )),
      );
}
