// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/features/dashboard_features/shared/widgets/dashboard_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarsPage extends StatelessWidget {
  const CarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CarsView();
  }
}

class CarsView extends StatefulWidget {
  const CarsView({super.key});

  @override
  State<CarsView> createState() => _CarsViewState();
}

class _CarsViewState extends State<CarsView> {
  int selectedBrand = 0;
  int selectedModel = 0;

  @override
  Widget build(BuildContext context) {
    return DashboardAppbar.title(
        title: "Cars",
        body: Center(
          child: Column(
            children: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => context.push(RoutesK.addCar),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => context.push(RoutesK.complexAddCar),
              ),
            ],
          ),
        ));
  }
}
