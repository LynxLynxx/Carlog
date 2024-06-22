// ignore_for_file: must_be_immutable

import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/input_styles.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickCarBrandManuallyWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  PickCarBrandManuallyWidget({
    super.key,
    required this.textEditingController,
  });

  FocusNode f1 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Car Brand",
          style:
              context.titleLarge!.copyWith(color: context.onPrimaryContainer),
        ),
        TextFormField(
          key: const Key("brand_field"),
          controller: textEditingController,
          autocorrect: false,
          decoration: authTextFormFieldInputDecoration(
              context,
              context.read<ManageCarBloc>().state.brandEntity.displayError,
              "Brand",
              errorMaxLine: 2),
          textInputAction: TextInputAction.go,
          focusNode: f1,
          onEditingComplete: () {
            f1.unfocus();
          },
          onChanged: (value) => context
              .read<ManageCarBloc>()
              .add(ManageCarEvent.brandChanged(value)),
        ),
      ],
    );
  }
}
