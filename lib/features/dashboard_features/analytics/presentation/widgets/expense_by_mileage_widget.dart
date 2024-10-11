import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/widgets/line_chart_expense_mileage.dart';
import 'package:flutter/material.dart';

class ExpenseByMileageWidget extends StatelessWidget {
  final List<CarExpenseEntity> carExpenseList;
  const ExpenseByMileageWidget(
    this.carExpenseList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Expense by mileage", style: context.titleLarge),
        LineChartExpenseMileage(carExpenseList: carExpenseList),
      ],
    );
  }
}
