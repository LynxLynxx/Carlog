import 'package:carlog/shared/widgets/responsive_widget.dart';
import 'package:carlog/web_features/web_contact/presentation/pages/web_contact_view_large.dart';
import 'package:flutter/material.dart';

class WebContactPage extends StatelessWidget {
  const WebContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isLargeScreen(context)
        ? const WebContactViewLarge()
        : const WebContactViewLarge();
  }
}
