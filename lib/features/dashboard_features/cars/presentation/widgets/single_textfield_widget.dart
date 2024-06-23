// ignore_for_file: must_be_immutable

import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/core/theme/styles/input_styles.dart';
import 'package:flutter/material.dart';

class SingleTextFieldWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController textEditingController;
  final Function() func;
  final Function(String) func2;
  SingleTextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.func,
    required this.title,
    required this.hintText,
    required this.func2,
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
              GestureDetector(onTap: func, child: const Icon(Icons.close)),
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
              decoration: carTextFormFieldInputDecoration(context, hintText,
                  errorMaxLine: 2),
              textInputAction: TextInputAction.go,
              focusNode: f1,
              onEditingComplete: () {
                f1.unfocus();
              },
              onChanged: func2,
            ),
          ),
        ],
      ),
    );
  }
}
