import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_enum.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/widgets/expenses_by_type_bar_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';

class ExpensesByTypesWidget extends StatelessWidget {
  final List<CarExpenseEntity> carExpenseList;
  const ExpensesByTypesWidget(
    this.carExpenseList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(S.of(context).expensesByType, style: context.titleLarge),
        ExpensesByTypeBarWidget(carExpenseList),
        const TypeBarIconTextWidget(),
      ],
    );
  }
}

class TypeBarIconTextWidget extends StatelessWidget {
  const TypeBarIconTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        childAspectRatio: 10 / 1,
        mainAxisSpacing: 8,
        // crossAxisSpacing: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          CarExpenseEnum.values.length,
          (index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  CarExpenseExtension.getCustomIcon(
                    CarExpenseEnum.values[index],
                  ),
                ),
                const SizedBox(width: 10),
                Text(CarExpenseExtension.getCustomName(
                    CarExpenseEnum.values[index])),
              ],
            );
          },
        ),
      ),
    );
  }
}
