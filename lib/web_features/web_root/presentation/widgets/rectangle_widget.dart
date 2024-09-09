import 'package:carlog/core/constants/images.dart';
import 'package:flutter/material.dart';

class RectangleWidget extends StatelessWidget {
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  const RectangleWidget(
      {super.key,
      this.top,
      this.right,
      this.bottom,
      this.left});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        right: right,
        bottom: bottom,
        left: left,
        child: Image.asset(ImagesK.rectangleBackground,
            width: 1600, height: 1600));
  }
}
