import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:flutter/material.dart';

ButtonStyle tutorialButton(BuildContext context) => ElevatedButton.styleFrom(
      elevation: 6,
      backgroundColor: context.onSurface,
      shape: RoundedRectangleBorder(borderRadius: PaddingsK.circular10),
    );
