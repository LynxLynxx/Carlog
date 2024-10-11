// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/widgets/line_chart_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';

class TwoMonthsExpansionInfoWidget extends StatelessWidget {
  final List<CarExpenseEntity> carExpenseList;
  final num thisMonthExpenses;
  final num lastMonthExpenses;
  final double percantageChange;

  const TwoMonthsExpansionInfoWidget._({
    required this.carExpenseList,
    required this.thisMonthExpenses,
    required this.lastMonthExpenses,
    required this.percantageChange,
    super.key,
  });

  factory TwoMonthsExpansionInfoWidget(
    List<CarExpenseEntity> carExpenseList,
  ) {
    final DateTime now = DateTime.now();
    final DateTime lastMonth = DateTime(now.year, now.month - 1);

    //calculate this month expenses
    num thisMonthExpenses = 0;
    for (var expense in carExpenseList) {
      if (expense.timestamp!.month == now.month) {
        thisMonthExpenses += expense.amount!;
      }
    }
    //calculate only last month expenses
    num lastMonthExpenses = 0;
    for (var expense in carExpenseList) {
      if (expense.timestamp!.month == lastMonth.month) {
        lastMonthExpenses += expense.amount!;
      }
    }

    //calculate percantage change, but last or this month expenses can be 0
    double percantageChange =
        calculatePercentageChange(lastMonthExpenses, thisMonthExpenses);
    return TwoMonthsExpansionInfoWidget._(
      carExpenseList: carExpenseList,
      thisMonthExpenses: thisMonthExpenses,
      lastMonthExpenses: lastMonthExpenses,
      percantageChange: percantageChange,
    );
  }
  static double calculatePercentageChange(num lastMonth, num thisMonth) {
    if (lastMonth == 0 && thisMonth == 0) {
      return 0;
    } else if (lastMonth == 0) {
      return thisMonth > 0
          ? 100
          : -100; // Assuming the change from 0 to a positive/negative value is 100% change
    } else {
      return ((thisMonth - lastMonth) / lastMonth.abs()) * 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChartWidget(
          prices: [lastMonthExpenses, thisMonthExpenses],
          isLoaded: false,
        ),
        Positioned(
          top: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextChartTitle(
                title: "This month expenses:",
                value: thisMonthExpenses,
              ),
              TextChartTitle(
                title: "Last month expenses:",
                value: lastMonthExpenses,
              ),
              TextChartPercatage(value: percantageChange),
            ],
          ),
        ),
      ],
    );
  }
}

class TextChartPercatage extends StatelessWidget {
  final num value;
  const TextChartPercatage({super.key, required this.value});

  bool get isPositive => value <= 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${value.abs().toStringAsFixed(0)}%",
          style: context.displayMedium
              ?.copyWith(color: isPositive ? Colors.green : context.errorColor),
        ),
        Text(
          S.of(context).positiveChartText(isPositive.toString()),
          style: context.titleLarge
              ?.copyWith(color: isPositive ? Colors.green : context.errorColor),
        ),
      ],
    );
  }
}

class TextChartTitle extends StatelessWidget {
  const TextChartTitle({
    super.key,
    required this.value,
    required this.title,
  });
  final String title;
  final num value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: context.titleMedium,
        children: [
          TextSpan(
            text: " $value",
            style: context.headlineMedium,
          ),
        ],
      ),
    );
  }
}
