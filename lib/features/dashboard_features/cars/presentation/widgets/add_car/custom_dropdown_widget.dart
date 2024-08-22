// ignore_for_file: must_be_immutable

import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropdownWidget extends StatelessWidget {
  final int id;
  final String title;
  const CustomDropdownWidget({
    super.key,
    required this.title,
    required this.id,
  });

  getWidget(ManageCarState state) {
    switch (id) {
      case 0:
        return _CarTypeWidget(state: state);
      case 1:
        return _FuelTypeWidget(state: state);
    }
  }

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
                        title,
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
          BlocBuilder<ManageCarBloc, ManageCarState>(
            builder: (context, state) {
              return Container(
                decoration: dropShadowEffect(context),
                child: DropdownButtonHideUnderline(
                  child: getWidget(state),
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

class _CarTypeWidget extends StatelessWidget {
  final ManageCarState state;
  const _CarTypeWidget({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<CarTypeEnum>(
      isExpanded: true,
      items: CarTypeEnum.values
          .map((CarTypeEnum carType) => DropdownMenuItem<CarTypeEnum>(
                value: carType,
                child: Text(
                  carType.name,
                  style: context.titleMedium!.copyWith(
                    color: context.onPrimaryContainer,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
      hint: Text(
        S.of(context).egSUV,
        style: context.bodySmall,
      ),
      value: state.typeEntity,
      onChanged: (carType) {
        context
            .read<ManageCarBloc>()
            .add(ManageCarEvent.carTypeChanged(carType!));
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
    );
  }
}

class _FuelTypeWidget extends StatelessWidget {
  final ManageCarState state;
  const _FuelTypeWidget({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<FuelTypeEnum>(
      isExpanded: true,
      items: FuelTypeEnum.values
          .map((FuelTypeEnum fuelType) => DropdownMenuItem<FuelTypeEnum>(
                value: fuelType,
                child: Text(
                  fuelType.name,
                  style: context.titleMedium!.copyWith(
                    color: context.onPrimaryContainer,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
      hint: Text(
        S.of(context).egHybrid,
        style: context.bodySmall,
      ),
      value: state.fuelTypeEntity,
      onChanged: (fuelType) {
        context
            .read<ManageCarBloc>()
            .add(ManageCarEvent.fuelTypeChanged(fuelType!));
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
    );
  }
}
