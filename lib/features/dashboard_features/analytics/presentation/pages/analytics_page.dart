import 'package:carlog/generated/l10n.dart';
import 'package:carlog/shared/widgets/carlog_car_appbar.dart';
import 'package:carlog/shared/widgets/carlog_scaffold.dart';
import 'package:flutter/material.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarlogScaffold.appbar(
        appBar: carlogCarAppBar(
          context,
        ),
        body: Center(
          child: Text(S.of(context).analytics),
        ));
  }
}
