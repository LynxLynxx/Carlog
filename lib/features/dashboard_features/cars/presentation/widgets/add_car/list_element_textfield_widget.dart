// ignore_for_file: must_be_immutable

import 'package:carlog/core/addons/error_widget.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/core/theme/styles/input_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListElementTextfieldWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController textEditingController;
  final Function(String) func;
  final TextInputType textInputType;
  final List<TextInputFormatter>? textInputFormatterList;
  final String displayError;
  final bool isRequired;
  final Function()? funcClose;
  const ListElementTextfieldWidget({
    super.key,
    required this.textEditingController,
    required this.func,
    required this.title,
    required this.hintText,
    this.textInputFormatterList,
    this.textInputType = TextInputType.text,
    required this.displayError,
    this.isRequired = false,
    this.funcClose,
  });

  @override
  Widget build(BuildContext context) {
    if (textEditingController.text == "null") {
      textEditingController.clear();
    }
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
                      const SizedBox(
                        width: 5,
                      ),
                      if (isRequired)
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
                if (funcClose != null)
                  GestureDetector(
                    onTap: funcClose,
                    child: Icon(
                      Icons.close,
                      color: context.primaryColor,
                    ),
                  ),
              ],
            ),
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
              keyboardType: textInputType,
              style: context.titleMedium,
              inputFormatters: textInputFormatterList,
              onChanged: (func),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ErrorBannerWidget(
              displayError: displayError.isNotEmpty ? displayError : ""),
        ],
      ),
    );
  }
}
