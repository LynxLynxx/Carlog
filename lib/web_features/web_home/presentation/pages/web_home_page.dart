import 'package:carlog/shared/widgets/responsive_widget.dart';
import 'package:carlog/web_features/web_home/presentation/pages/web_home_view_large.dart';
import 'package:flutter/material.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isLargeScreen(context)
        ? const WebHomeViewLarge()
        : const WebHomeViewLarge();
  }
}
