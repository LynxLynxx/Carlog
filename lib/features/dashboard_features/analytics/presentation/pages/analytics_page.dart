import 'package:carlog/features/dashboard_features/shared/widgets/dashboard_appbar.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardAppbar.title(
        title: S.of(context).analytics,
        body: Center(
          child: Text(S.of(context).analytics),
        ));
  }
}
