import 'dart:developer';

import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/bloc/analytics_bloc.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/widgets/expense_by_dt_widget.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/widgets/expenses_by_types_widget.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/widgets/two_months_expansion_info_widget.dart';
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
              data: (carExpenseList) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text("Statistics", style: context.titleLarge),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxHeight: 420),
                    child: CarouselView(
                      itemExtent: MediaQuery.of(context).size.width * 0.9,
                      shrinkExtent: 280,
                      itemSnapping: true,
                      elevation: 4,
                      padding: const EdgeInsets.all(8),
                      backgroundColor: context.surfaceContainerHighest,
                      overlayColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      children: [
                        TwoMonthsExpansionInfoWidget(carExpenseList),
                        ExpensesByTypesWidget(carExpenseList),
                        ExpenseByDtWidget(carExpenseList),
                      ],
                    ),
                  ),
                  _buildBody(carExpenseList),
                ],
              ),
              failure: (failure) => ErrorIndicator(failure: failure),
            );
          },
        ));
  }

  _buildBody(List<CarExpenseEntity> carExpenseList) => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
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
