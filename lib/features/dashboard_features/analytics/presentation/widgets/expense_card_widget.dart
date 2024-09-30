import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_enum.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseCardWidget extends StatelessWidget {
  final CarExpenseEntity carExpenseEntity;
  const ExpenseCardWidget({super.key, required this.carExpenseEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            child: ListTile(
              dense: true,
              leading: Image.asset(
                CarExpenseExtension.getCustomIcon(carExpenseEntity.expense),
                width: 40,
              ),
              title: Text(
                  CarExpenseExtension.getCustomName(carExpenseEntity.expense)),
              subtitle: Text(carExpenseEntity.timestamp != null
                  ? DateFormat.yMMMEd().format(carExpenseEntity.timestamp!)
                  : ""),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: context.errorContainer.withOpacity(.7),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
