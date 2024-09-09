import 'package:flutter/material.dart';

class WebContactViewLarge extends StatelessWidget {
  const WebContactViewLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const Center(
        child: Text("Web contact"),
      ),
    );
  }
}
