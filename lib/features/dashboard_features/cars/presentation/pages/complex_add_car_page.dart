import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/add_car_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/complex_add_car_form_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

enum ManageCarStatus { add, edit }

class ComplexManageCarPage extends StatelessWidget {
  final ManageCarStatus manageCarStatus;
  final CarFirebaseEntity? carFirebaseEntity;

  const ComplexManageCarPage(
      {super.key,
      this.manageCarStatus = ManageCarStatus.add,
      this.carFirebaseEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = AddCarBloc(locator());
        if (manageCarStatus == ManageCarStatus.edit) {
          bloc.add(AddCarEvent.setInitialCar(carFirebaseEntity!));
        }
        return bloc;
      },
      child: ComplexManageCarView(
        manageCarStatus: manageCarStatus,
      ),
    );
  }
}

class ComplexManageCarView extends StatelessWidget {
  final ManageCarStatus manageCarStatus;
  final CarFirebaseEntity? carFirebaseEntity;

  const ComplexManageCarView(
      {super.key, required this.manageCarStatus, this.carFirebaseEntity});

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
                  manageCarStatus == ManageCarStatus.add
                      ? S.of(context).addCar
                      : S.of(context).updateCar,
                  style: text22W700LS3,
                ),
              ],
            ),
            Padding(
              padding: PaddingsK.all16,
              child: ComplexAddCarFormWidget(
                  manageCarStatus: manageCarStatus,
                  addCarBloc: context.read<AddCarBloc>()),
            )
          ],
        ),
      ),
    );
  }
}
