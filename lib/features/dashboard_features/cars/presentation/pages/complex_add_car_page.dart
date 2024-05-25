import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/add_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/complex_add_car_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplexAddCarPage extends StatelessWidget {
  const ComplexAddCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCarBloc(locator()),
      child: const ComplexAddCarView(),
    );
  }
}

class ComplexAddCarView extends StatelessWidget {
  const ComplexAddCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: ComplexAddCarFormWidget(),
      ),
    );
  }
}
