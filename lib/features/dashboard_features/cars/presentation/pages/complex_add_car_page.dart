import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/add_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/complex_add_car_form_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back_ios)),
                Text(
                  S.of(context).addCar,
                  style: text22W700LS3,
                ),
              ],
            ),
            const Padding(
              padding: PaddingsK.all16,
              child: ComplexAddCarFormWidget(),
            )
          ],
        ),
      ),
    );
  }
}
