import 'package:flutter/material.dart';

Future<T?> dialogBuilder<T>(
    BuildContext appContext, Widget dialogContent) async {
  return await showDialog(
    context: appContext,
    builder: (context) => dialogContent,
  );
}
