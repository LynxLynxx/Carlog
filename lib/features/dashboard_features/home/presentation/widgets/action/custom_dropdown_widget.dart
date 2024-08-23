// ignore_for_file: must_be_immutable

import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/manage_action/manage_action_bloc.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_enum.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropdownWidget extends StatelessWidget {
  const CustomDropdownWidget({
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
          BlocBuilder<ManageActionBloc, ManageActionState>(
            builder: (context, state) {
              return Container(
                decoration: dropShadowEffect(context),
                child: DropdownButtonHideUnderline(
                  child: _CarActionWidget(state: state),
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

class _CarActionWidget extends StatelessWidget {
  final ManageActionState state;
  const _CarActionWidget({
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
      child: DropdownButton2<CarActionEnum>(
        isExpanded: true,
        items: CarActionEnum.values
            .map((CarActionEnum carAction) => DropdownMenuItem<CarActionEnum>(
                  value: carAction,
                  child: Text(
                    CarActionEnumExtension.getCustomName(carAction),
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
        value: state.action,
        onChanged: (carAction) {
          context
              .read<ManageActionBloc>()
              .add(ManageActionEvent.changeActionType(carAction!));
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
