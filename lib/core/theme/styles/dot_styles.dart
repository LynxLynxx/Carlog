import 'package:carlog/core/constants/paddings.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

DotsDecorator dotsDecorator(context) => DotsDecorator(
      color: context.primaryColorContainer,
      activeColor: const Color.fromRGBO(74, 74, 110, 1),
      size: const Size(12.0, 12.0),
      activeSize: const Size(24.0, 12.0),
      activeShape: RoundedRectangleBorder(borderRadius: PaddingsK.circular5),
      shape: RoundedRectangleBorder(borderRadius: PaddingsK.circular5),
    );
