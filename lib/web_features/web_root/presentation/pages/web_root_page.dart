import 'package:carlog/shared/widgets/responsive_widget.dart';
import 'package:carlog/web_features/web_root/presentation/pages/web_root_view_large.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WebRootPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const WebRootPage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isLargeScreen(context)
        ? WebRootViewLarge(
            navigationShell: navigationShell,
          )
        : WebRootViewLarge(
            navigationShell: navigationShell,
          );
  }
}
