import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Widget to build the chart
class LineChartExpenseDt extends StatelessWidget {
  final List<CarExpenseEntity> carExpenseList;
  const LineChartExpenseDt({super.key, required this.carExpenseList});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: LineChart(
        mainData(carExpenseList, context),
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
      ),
    );
  }

  LineChartData mainData(
      List<CarExpenseEntity> carExpenseList, BuildContext context) {
    Map<String, num> groupedExpenses = {};
    for (var expense in carExpenseList) {
      if (expense.timestamp != null && expense.amount != null) {
        String day = DateFormat('yyyy-MM-dd').format(expense.timestamp!);
        if (groupedExpenses.containsKey(day)) {
          groupedExpenses[day] = groupedExpenses[day]! + expense.amount!;
        } else {
          groupedExpenses[day] = expense.amount!;
        }
      }
    }

    List<FlSpot> flSpots = groupedExpenses.entries.map((entry) {
      DateTime date = DateFormat('yyyy-MM-dd').parse(entry.key);
      return FlSpot(
          date.millisecondsSinceEpoch.toDouble(), entry.value.toDouble());
    }).toList();

    flSpots.sort((a, b) => a.x.compareTo(b.x));

    return LineChartData(
      gridData: const FlGridData(
        show: true,
        horizontalInterval: 50,
        verticalInterval: 100,
      ),
      titlesData: FlTitlesData(
        show: true,
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) => Text(DateFormat("d/MM/yy")
                .format(DateTime.fromMillisecondsSinceEpoch(value.toInt()))),
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      lineTouchData: const LineTouchData(
        handleBuiltInTouches: true,
      ),
      // minX: flSpots.first.x,
      // maxX: flSpots.last.x,
      lineBarsData: [
        LineChartBarData(
          spots: flSpots,
          color: context.secondaryColor,
          shadow: Shadow(
            color: context.secondaryColor.withOpacity(0.3),
            blurRadius: 5,
          ),
          isCurved: false,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                context.secondaryColor.withOpacity(0.5),
                context.secondaryColor.withOpacity(0.2),
                context.secondaryColor.withOpacity(0.001),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
