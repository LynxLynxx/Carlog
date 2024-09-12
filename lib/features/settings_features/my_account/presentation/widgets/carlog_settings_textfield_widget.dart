import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/core/theme/styles/input_styles.dart';
import 'package:flutter/material.dart';

class CarlogSettingTextField extends StatelessWidget {
  final String labelText;
  final bool readOnly;
  final String? initialValue;
  final TextEditingController? textController;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  final Function(String?)? onEditingComplete;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextCapitalization? textCapitalization;
  const CarlogSettingTextField({
    super.key,
    required this.labelText,
    this.readOnly = false,
    this.initialValue,
    this.textController,
    this.validator,
    this.keyboardType,
    this.onEditingComplete,
    this.textInputAction,
    this.focusNode,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: context.labelLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: carlogBoxShadow(context),
            ),
            child: TextFormField(
              focusNode: focusNode,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              decoration: carlogInputSettingsDecoration(context, null),
              readOnly: readOnly,
              initialValue: initialValue,
              controller: textController,
              validator: validator,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              onFieldSubmitted: onEditingComplete,
            ),
          ),
        ],
      ),
    );
  }
}
