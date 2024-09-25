import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/widgets/line_chart_expense_dt.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';

class ExpenseByDtWidget extends StatelessWidget {
  final List<CarExpenseEntity> carExpenseList;
  const ExpenseByDtWidget(
    this.carExpenseList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(S.of(context).expenseByDt, style: context.titleLarge),
          ),
        ),
        Center(child: LineChartExpenseDt(carExpenseList: carExpenseList))
      ],
    );
  }
}
