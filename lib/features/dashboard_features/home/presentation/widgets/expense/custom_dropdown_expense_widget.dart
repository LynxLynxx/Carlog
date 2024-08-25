// ignore_for_file: must_be_immutable

import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_enum.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/manage_expense/manage_expense_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropdownExpenseWidget extends StatelessWidget {
  const CustomDropdownExpenseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingsK.h10,
      child: Column(
        children: [
          SizedBox(
            height: 25,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        S.of(context).type,
                        style: context.titleLarge!.copyWith(
                          color: context.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<ManageExpenseBloc, ManageExpenseState>(
            builder: (context, state) {
              return Container(
                decoration: dropShadowEffect(context),
                child: DropdownButtonHideUnderline(
                  child: _CarExpenseWidget(state: state),
                ),
              );
            },
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class _CarExpenseWidget extends StatelessWidget {
  final ManageExpenseState state;
  const _CarExpenseWidget({
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
      child: DropdownButton2<CarExpenseEnum>(
        isExpanded: true,
        items: CarExpenseEnum.values
            .map(
                (CarExpenseEnum carExpense) => DropdownMenuItem<CarExpenseEnum>(
                      value: carExpense,
                      child: Text(
                        CarExpenseExtension.getCustomName(carExpense),
                        style: context.titleMedium!.copyWith(
                          color: context.onPrimaryContainer,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
            .toList(),
        hint: Text(
          S.of(context).egService,
          style: context.bodySmall,
        ),
        value: state.expense,
        onChanged: (carAction) {
          context
              .read<ManageExpenseBloc>()
              .add(ManageExpenseEvent.changeExpenseType(carAction!));
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
          width: 230,
          decoration: BoxDecoration(
            borderRadius: PaddingsK.circular10,
            color: context.surfaceColor,
          ),
          offset: const Offset(0, -10),
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
