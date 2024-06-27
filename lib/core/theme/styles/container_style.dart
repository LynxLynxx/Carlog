import 'package:carlog/core/constants/paddings.dart';
import 'package:flutter/material.dart';

BoxDecoration dropShadowEffect() => BoxDecoration(
      borderRadius: PaddingsK.circular10,
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0, 4),
          blurRadius: 4,
          spreadRadius: 0,
        ),
      ],
    );
