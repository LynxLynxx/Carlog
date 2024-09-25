import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// Widget to build the chart
class ChartWidget extends StatelessWidget {
  final List<num> prices;
  final bool isLoaded;
  const ChartWidget({super.key, required this.prices, required this.isLoaded});

  bool get isPositive => prices[1] < prices[0];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: LineChart(
        mainData(prices, context, isLoaded),
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
      ),
    );
  }

  // Function to build the chart data
  LineChartData mainData(
      final List<num> prices, BuildContext context, bool isLoaded) {
    return LineChartData(
      gridData: const FlGridData(show: false),
      titlesData: const FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      lineTouchData: const LineTouchData(
        // touchTooltipData: LineTouchTooltipData(
        //     getTooltipColor: (touchedSpot) =>
        //         context.secondaryColor.withOpacity(0.3),
        //     getTooltipItems: (List<LineBarSpot> touchedSpots) {
        //       return touchedSpots.map((LineBarSpot touchedSpot) {
        //         return LineTooltipItem(currency.format(touchedSpot.y),
        //             context.titleSmall!.copyWith(color: context.onSurface));
        //       }).toList();
        //     }),
        handleBuiltInTouches: true,
      ),
      // minX: 0,
      // maxX: prices.length.toDouble() - 1,
      // minY: getMinY.toDouble(),
      // maxY: isLoaded ? getMaxY.toDouble() : 1,
      lineBarsData: [
        LineChartBarData(
          //map prices to spots x should be index and y should be price
          spots: prices
              .map((price) =>
                  FlSpot(prices.indexOf(price).toDouble(), price.toDouble()))
              .toList(),
          color: isPositive ? Colors.green : context.errorColor,
          shadow: Shadow(
            color: isPositive
                ? Colors.green.withOpacity(0.3)
                : context.errorColor.withOpacity(0.3),
            blurRadius: 5,
          ),
          isCurved: true,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: isPositive
                  ? [
                      Colors.green.withOpacity(0.7),
                      Colors.green.withOpacity(0.35),
                      Colors.green.withOpacity(0.001),
                    ]
                  : [
                      context.errorContainer.withOpacity(0.7),
                      context.errorContainer.withOpacity(0.35),
                      context.errorContainer.withOpacity(0.001),
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
