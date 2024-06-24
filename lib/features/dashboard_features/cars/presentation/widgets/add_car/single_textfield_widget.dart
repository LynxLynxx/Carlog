// ignore_for_file: must_be_immutable

import 'package:carlog/core/addons/error_widget.dart';
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
  final String displayError;
  SingleTextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.func,
    required this.title,
    required this.hintText,
    required this.func2,
    this.displayError = "",
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
                child: Row(
                  children: [
                    Text(
                      title,
                      style: context.titleLarge!.copyWith(
                        color: context.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 15,
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.star,
                        color: context.errorColor,
                        size: 10,
                      ),
                    ),
                  ],
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
          const SizedBox(
            height: 5,
          ),
          ErrorBannerWidget(
              displayError: displayError.isNotEmpty ? displayError : ""),
        ],
      ),
    );
  }
}
