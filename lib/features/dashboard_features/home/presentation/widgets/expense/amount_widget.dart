import 'package:carlog/features/dashboard_features/cars/presentation/bloc/manage_expense/manage_expense_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/add_car/list_element_textfield_widget.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/expense/custom_dropdown_currency_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmountWidget extends StatelessWidget {
  final TextEditingController amountEditingController;
  final ManageExpenseState state;
  const AmountWidget(
      {super.key, required this.amountEditingController, required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ListElementTextfieldWidget(
              textEditingController: amountEditingController,
              func: (value) {
                context
                    .read<ManageExpenseBloc>()
                    .add(ManageExpenseEvent.changeAmountEvent(value));
              },
              title: S.of(context).amount,
              hintText: S.of(context).eg100,
              textInputType: TextInputType.number,
              textInputFormatterList: [FilteringTextInputFormatter.digitsOnly],
              displayError: state.amount.displayError ?? ""),
        ),
        const Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              CustomDropdownCurrencyWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
