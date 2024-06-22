import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:flutter/material.dart';

InputDecoration authTextFormFieldInputDecoration(
        BuildContext context, String? errorText, String labelText,
        // ignore: avoid_init_to_null
        {int? errorMaxLine = null,
        Widget? changeObscure}) =>
    InputDecoration(
      labelText: labelText,
      errorText: errorText,
      errorMaxLines: errorMaxLine,
      border: InputBorder.none,
      suffixIcon: changeObscure,
      contentPadding: const EdgeInsets.all(12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 1,
          color: context.outline,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 1,
          color: context.primaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 1,
          color: context.errorColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          width: 1,
          color: context.errorColor,
        ),
      ),
    );
