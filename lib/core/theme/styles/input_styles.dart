import 'package:flutter/material.dart';

InputDecoration authTextFormFieldInputDecoration(
        BuildContext context, String? errorText, String labelText,
        // ignore: avoid_init_to_null
        {int? errorMaxLine = null}) =>
    InputDecoration(
      labelText: labelText,
      errorText: errorText,
      errorMaxLines: errorMaxLine,
      border: InputBorder.none,
      contentPadding: const EdgeInsets.all(12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.error,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
