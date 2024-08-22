import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:flutter/material.dart';

BoxDecoration dropShadowEffect(BuildContext context) => BoxDecoration(
      borderRadius: PaddingsK.circular10,
      color: context.onPrimary,
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0, 4),
          blurRadius: 4,
          spreadRadius: 0,
        ),
      ],
    );

List<BoxShadow> carlogBoxShadow(BuildContext context) => [
      BoxShadow(
        color: context.shadow.withOpacity(0.6),
        blurRadius: 10,
        offset: const Offset(2, 8),
      )
    ];
