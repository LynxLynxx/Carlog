import 'package:carlog/features/dashboard_features/shared/widgets/dashboard_appbar.dart';
import 'package:flutter/material.dart';

class CarsPage extends StatelessWidget {
  const CarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardAppbar.title(
        title: "Cars",
        body: Center(
          child: Text("Cars"),
        ));
  }
}
