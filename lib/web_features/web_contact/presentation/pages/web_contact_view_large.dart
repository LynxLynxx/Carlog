import 'package:carlog/core/constants/images.dart';
import 'package:flutter/material.dart';

class WebContactViewLarge extends StatelessWidget {
  const WebContactViewLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          _buildRectangle(),
          const Center(
            child: Text("Web contact"),
          ),
        ],
      ),
    );
  }

  Widget _buildRectangle() => Align(
      alignment: Alignment.topRight,
      child: Image.asset(ImagesK.backgroundLeft));
}
