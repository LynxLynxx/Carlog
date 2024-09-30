import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Widget to build the chart
class LineChartExpenseDt extends StatefulWidget {
  final List<CarExpenseEntity> carExpenseList;
  const LineChartExpenseDt({super.key, required this.carExpenseList});

  @override
  State<LineChartExpenseDt> createState() => _LineChartExpenseDtState();
}

class _LineChartExpenseDtState extends State<LineChartExpenseDt> {
  List<FlSpot> flSpots = [];

  @override
  void initState() {
    prepare(widget.carExpenseList);
    super.initState();
  }

  void prepare(List<CarExpenseEntity> carExpenseList) {
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

    flSpots = groupedExpenses.entries.map((entry) {
      DateTime date = DateFormat('yyyy-MM-dd').parse(entry.key);
      return FlSpot(date.millisecondsSinceEpoch.toDouble() / 100000000000,
          entry.value.toDouble());
    }).toList();

    flSpots.sort((a, b) => a.x.compareTo(b.x));
  }

  getMaxY() {
    double max = 0;
    for (var spot in flSpots) {
      if (spot.y > max) {
        max = spot.y;
      }
    }
    return max;
  }

  getMinY() {
    double min = 5000000;
    for (var spot in flSpots) {
      if (spot.y < min) {
        min = spot.y;
      }
    }
    return min;
  }

  mainData(List<CarExpenseEntity> carExpenseList, BuildContext context) {
    return LineChartData(
      extraLinesData: ExtraLinesData(horizontalLines: [
        HorizontalLine(
          y: getMaxY(),
          color: context.primaryColor,
          strokeWidth: 1,
          dashArray: [5, 5],
        ),
        HorizontalLine(
          y: getMinY(),
          color: context.primaryColor,
          strokeWidth: 1,
          dashArray: [5, 5],
        ),
      ]),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: getMaxY() / 3,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: context.primaryColor,
            strokeWidth: 1,
            dashArray: [5, 5],
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: context.primaryColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 35,
            showTitles: true,
            interval: getMaxY() / 3,
            getTitlesWidget: (value, meta) => Text(value.toStringAsFixed(0),
                style: context.bodySmall, textAlign: TextAlign.center),
          ),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 75,
            getTitlesWidget: (value, meta) {
              return Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    DateFormat("d/MM/yy").format(DateTime.now()),
                    style: context.bodySmall,
                  ),
                ),
              );
            },
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
            show: true,
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

  @override
  Widget build(BuildContext context) {
    if (widget.carExpenseList.isEmpty) {
      return Center(
        child: Text(
          S.of(context).noExpenses,
          style: context.bodyLarge,
          textAlign: TextAlign.center,
        ),
      );
    }
    return AspectRatio(
      aspectRatio: 1.1,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20),
        child: LineChart(
          mainData(widget.carExpenseList, context),
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
        ),
      ),
    );
  }
}
