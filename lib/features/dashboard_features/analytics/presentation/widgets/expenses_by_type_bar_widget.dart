import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_enum.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpensesByTypeBarWidget extends StatelessWidget {
  final List<CarExpenseEntity> carExpenseList;
  const ExpensesByTypeBarWidget(
    this.carExpenseList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (carExpenseList.isEmpty) {
      return Expanded(
        child: Center(
          child: Text(
            S.of(context).noExpenses,
            style: context.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return AspectRatio(
      aspectRatio: 1.45,
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: 0,
          sections: showingSections(carExpenseList, context),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      List<CarExpenseEntity> carExpenseList, BuildContext context) {
    double totalSum = carExpenseList.fold(0, (sum, item) => sum + item.amount!);
    return List.generate(CarExpenseEnum.values.length, (i) {
      double expenseSum = carExpenseList
          .where((expense) => expense.expense == CarExpenseEnum.values[i])
          .fold(0, (sum, item) => sum + item.amount!);

      // Step 3: Calculate the percentage
      double percentage = totalSum != 0 ? (expenseSum / totalSum) * 100 : 0;
      const radius = 105.0;
      const widgetSize = 45.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      final fontStyle = context.bodyLarge?.copyWith(
          color: Colors.white, fontWeight: FontWeight.bold, shadows: shadows);

      //calculate percatage for every section from expense list by its expense type

      return PieChartSectionData(
        color: CarExpenseExtension.getCustomColor(CarExpenseEnum.values[i]),
        value: percentage,
        title: '${percentage.toStringAsFixed(1)}%',
        radius: radius,
        titleStyle: fontStyle,
        badgeWidget: _Badge(
          CarExpenseExtension.getCustomIcon(CarExpenseEnum.values[i]),
          size: widgetSize,
          borderColor: Colors.white,
        ),
        badgePositionPercentageOffset: .98,
      );
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Image.asset(
          svgAsset,
        ),
      ),
    );
  }
}
