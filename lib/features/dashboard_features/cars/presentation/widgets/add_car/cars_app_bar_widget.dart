import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CarsAppBarWidget extends StatelessWidget {
  final int page;
  final Function func;
  final BuildContext context;
  const CarsAppBarWidget(
      {super.key,
      required this.page,
      required this.func,
      required this.context});

  Widget getAction() {
    switch (page) {
      case 3:
        return TextButton(
          onPressed: () {
            func();
            context
                .read<ManageCarBloc>()
                .add(const ManageCarEvent.carTypeChanged(""));
            context
                .read<ManageCarBloc>()
                .add(const ManageCarEvent.fuelTypeChanged(""));
            context
                .read<ManageCarBloc>()
                .add(const ManageCarEvent.engineCapacityChanged(""));
            context
                .read<ManageCarBloc>()
                .add(const ManageCarEvent.enginePowerChanged(""));
          },
          child: Text(
            S.of(context).skip,
            style: context.titleSmall!.copyWith(color: context.secondaryColor),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios)),
        Expanded(
          child: Text(S.of(context).addCar,
              style: context.titleLarge!.copyWith(
                color: context.onPrimaryContainer,
              )),
        ),
        getAction(),
      ],
    );
  }
}
