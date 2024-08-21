import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/cars/car_list_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:carlog/shared/widgets/carlog_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarsPage extends StatelessWidget {
  const CarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarsBloc(locator())..add(const CarsEvent.getCars()),
      child: const CarsView(),
    );
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
    return CarlogScaffold.title(
      title: S.of(context).cars,
      body: const Column(
        children: [
          CarListWidget(),
        ],
      ),
    );
  }
}
