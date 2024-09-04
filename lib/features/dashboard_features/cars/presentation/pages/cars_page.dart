import 'package:carlog/features/dashboard_features/cars/presentation/widgets/cars/car_list_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:carlog/shared/widgets/carlog_scaffold.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return CarlogScaffold.title(
      title: S.of(context).cars,
      body: const CarListWidget(),
    );
  }
}
