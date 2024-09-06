import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget smallScreen;

  const ResponsiveWidget({
    super.key,
    required this.largeScreen,
    required this.smallScreen,
  });

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 950;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 950) {
          return largeScreen;
        } else {
          return smallScreen;
        }
      },
    );
  }
}
