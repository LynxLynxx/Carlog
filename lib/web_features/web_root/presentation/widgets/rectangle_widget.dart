import 'package:carlog/core/constants/images.dart';
import 'package:flutter/material.dart';

class RectangleWidget extends StatelessWidget {
  final double height;
  final double width;
  const RectangleWidget({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: height,
        left: width,
        child: Image.asset(ImagesK.rectangleBackground,
            width: 2600, height: 2600));
  }
}
