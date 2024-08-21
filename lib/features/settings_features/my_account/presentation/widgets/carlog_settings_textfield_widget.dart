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
  const CarlogSettingTextField({
    super.key,
    required this.labelText,
    this.readOnly = false,
    this.initialValue,
    this.textController,
    this.validator,
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
          Container(
            decoration: BoxDecoration(
              boxShadow: carlogBoxShadow(context),
            ),
            child: TextFormField(
              decoration: carlogInputSettingsDecoration(context, null),
              readOnly: readOnly,
              initialValue: initialValue,
              controller: textController,
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
