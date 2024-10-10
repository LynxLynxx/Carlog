import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_enum.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/bloc/analytics_bloc.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
          onTap: () {
            context.pop();
            context.push(
              RoutesK.addExpense,
              extra: carExpenseEntity,
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            child: ListTile(
              dense: false,
              leading: Image.asset(
                CarExpenseExtension.getCustomIcon(carExpenseEntity.expense),
                width: 40,
              ),
              title: Text(
                CarExpenseExtension.getCustomName(carExpenseEntity.expense),
                style:
                    context.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${carExpenseEntity.amount} ${carExpenseEntity.currency}",
                    style: context.labelLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(carExpenseEntity.timestamp != null
                      ? DateFormat.yMMMEd().format(carExpenseEntity.timestamp!)
                      : ""),
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  final userCar = context
                      .read<UserAppBloc>()
                      .state
                      .whenOrNull(data: (user) => user?.carId);
                  if (userCar != null) {
                    context.read<AnalyticsBloc>().add(
                        AnalyticsEvent.deleteExpense(
                            carId: userCar,
                            carExpenseId: carExpenseEntity.carExpenseId));
                  }
                },
                icon: Icon(
                  Icons.delete,
                  color: context.errorColor.withOpacity(.7),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
