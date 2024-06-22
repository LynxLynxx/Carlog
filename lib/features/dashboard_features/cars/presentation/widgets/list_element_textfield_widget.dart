// ignore_for_file: must_be_immutable

import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/core/theme/styles/input_styles.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListElementTextfieldWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController textEditingController;
  final Function(String) func;
  final TextInputType textInputType;
  final List<TextInputFormatter>? textInputFormatterList;
  ListElementTextfieldWidget({
    super.key,
    required this.textEditingController,
    required this.func,
    required this.title,
    required this.hintText,
    this.textInputFormatterList,
    this.textInputType = TextInputType.text,
  });

  FocusNode f1 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingsK.h10,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: context.titleLarge!.copyWith(
                    color: context.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: dropShadowEffect(),
            child: TextFormField(
              controller: textEditingController,
              autocorrect: false,
              decoration: carTextFormFieldInputDecoration(
                  context,
                  context.read<ManageCarBloc>().state.brandEntity.displayError,
                  hintText,
                  errorMaxLine: 2),
              textInputAction: TextInputAction.go,
              keyboardType: textInputType,
              focusNode: f1,
              inputFormatters: textInputFormatterList,
              onEditingComplete: () {
                f1.unfocus();
              },
              onChanged: (func),
            ),
          ),
        ],
      ),
    );
  }
}
