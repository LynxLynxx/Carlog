import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/bloc/analytics_bloc.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/widgets/expense_by_dt_widget.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/widgets/expense_card_widget.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/widgets/expenses_by_types_widget.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/widgets/more_expense_widget.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/widgets/two_months_expansion_info_widget.dart';
import 'package:carlog/generated/l10n.dart';
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
            return state.when(
              initial: () => const CarlogLoader(),
              loading: () => const CarlogLoader(),
              data: (carExpenseList) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(S.of(context).statistics,
                        style: context.titleLarge),
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
                  if (carExpenseList.isNotEmpty) const MoreExpensesWidget(),
                  _buildBody(carExpenseList),
                ],
              ),
              failure: (failure) => ErrorIndicator(failure: failure),
            );
          },
        ));
  }

  _buildBody(List<CarExpenseEntity> carExpenseList) => ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      //last 5 expenses
      itemCount: carExpenseList.length > 5 ? 5 : carExpenseList.length,
      itemBuilder: (context, index) => ExpenseCardWidget(
            carExpenseEntity: carExpenseList[index],
          ));
}
