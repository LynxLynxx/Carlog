import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/widgets/all_expense_dialog_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';

class MoreExpensesWidget extends StatelessWidget {
  const MoreExpensesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        allExpenseModal(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).last5Expenses, style: context.titleLarge),
            Row(
              children: [
                Text(S.of(context).more, style: context.labelSmall),
                const Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
