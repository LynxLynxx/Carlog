import 'package:carlog/shared/widgets/responsive_widget.dart';
import 'package:carlog/web_features/web_request_feature/presentation/pages/web_request_feature_view_large.dart';
import 'package:flutter/material.dart';

class WebRequestFeaturePage extends StatelessWidget {
  const WebRequestFeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isLargeScreen(context)
        ? const WebRequestFeatureViewLarge()
        : const WebRequestFeatureViewLarge();
  }
}
