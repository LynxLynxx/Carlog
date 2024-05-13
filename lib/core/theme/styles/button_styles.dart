import 'package:carlog/core/constants/paddings.dart';
import 'package:flutter/material.dart';

ButtonStyle tutorialButton(BuildContext context) => ElevatedButton.styleFrom(
  elevation: 6,
  backgroundColor: Theme.of(context).colorScheme.onSurface,
  shape: RoundedRectangleBorder(borderRadius: PaddingsK.circular10),
);
