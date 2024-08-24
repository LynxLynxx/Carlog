import 'package:carlog/core/constants/paddings.dart';
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

InputDecoration carlogInputSettingsDecoration(
  BuildContext context,
  String? errorText, {
  String? labelText,
  Widget? changeObscure,
  int? errorMaxLine,
}) =>
    InputDecoration(
      errorText: errorText,
      errorMaxLines: errorMaxLine,
      border: InputBorder.none,
      suffixIcon: changeObscure,
      fillColor: context.surfaceBright,
      filled: true,
      contentPadding: const EdgeInsets.all(14),
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

InputDecoration carTextFormFieldInputDecoration(
        BuildContext context, String hintText,
        // ignore: avoid_init_to_null
        {int? errorMaxLine = null,
        Widget? changeObscure}) =>
    InputDecoration(
      hintText: hintText,
      hintStyle: context.bodySmall,
      border: InputBorder.none,
      suffixIcon: changeObscure,
      contentPadding: PaddingsK.all16,
      fillColor: context.onPrimary,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: PaddingsK.circular10,
        borderSide: BorderSide(
          width: 1,
          color: context.surfaceColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: PaddingsK.circular10,
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
        borderRadius: PaddingsK.circular10,
        borderSide: BorderSide(
          width: 1,
          color: context.errorColor,
        ),
      ),
    );
