// ignore_for_file: must_be_immutable

import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/core/utils/currencies.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/manage_expense/manage_expense_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:carlog/shared/entities/currency_entity.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropdownCurrencyWidget extends StatelessWidget {
  const CustomDropdownCurrencyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageExpenseBloc, ManageExpenseState>(
      builder: (context, state) {
        return Container(
          decoration: dropShadowEffect(context),
          child: DropdownButtonHideUnderline(
            child: _CurrencyWidget(state: state),
          ),
        );
      },
    );
  }
}

class _CurrencyWidget extends StatelessWidget {
  final ManageExpenseState state;
  const _CurrencyWidget({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: DropdownButton2<CurrencyEntity>(
        isExpanded: true,
        items: CurrenciesK()
            .getAll()
            .map((CurrencyEntity currency) => DropdownMenuItem<CurrencyEntity>(
                  value: currency,
                  child: Text(
                    currency.code,
                    style: context.titleMedium!.copyWith(
                      color: context.onPrimaryContainer,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        hint: Text(
          S.of(context).egEuro,
          style: context.bodySmall,
        ),
        value: state.currency,
        onChanged: (currency) {
          context
              .read<ManageExpenseBloc>()
              .add(ManageExpenseEvent.changeCurrency(currency!));
        },
        buttonStyleData: const ButtonStyleData(
          height: 55,
          width: double.infinity,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down,
          ),
          iconSize: 20,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: PaddingsK.circular10,
            color: context.surfaceColor,
          ),
          offset: const Offset(-20, -10),
          scrollbarTheme: const ScrollbarThemeData(
            radius: Radius.circular(40),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
