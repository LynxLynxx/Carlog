import 'package:carlog/features/dashboard_features/shared/widgets/dashboard_appbar.dart';
import 'package:flutter/material.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardAppbar.title(
        title: "Analytics",
        body: Center(
          child: Text("Analytics"),
        ));
  }
}
