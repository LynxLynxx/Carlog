import 'package:carlog/core/constants/jsons.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/add_car/manage_car_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickCarModelWidget extends StatelessWidget {
  const PickCarModelWidget({super.key});

  int? getBrandId(String brand) {
    for (var car in CarEntity.fromMap(JsonsK.cars)) {
      if (car.brand == brand) {
        return car.id;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final carList = CarEntity.fromMap(JsonsK.cars);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: BlocBuilder<ManageCarBloc, ManageCarState>(
            builder: (context, state) {
              int carId = getBrandId(state.brandEntity.value) ?? 0;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () => context.read<ManageCarBloc>().add(
                        ManageCarEvent.modelChanged(
                            carList[carId].models[index])),
                    child: _ListElementWidget(
                        maxHeight: 75,
                        model: carList[carId].models[index],
                        state: state)),
                itemCount: carList[carId].models.length,
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Unable to locate your model?",
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
        ),
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "Enter it manually!",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}

class _ListElementWidget extends StatelessWidget {
  const _ListElementWidget({
    required this.maxHeight,
    required this.model,
    required this.state,
  });

  final double maxHeight;
  final String model;
  final ManageCarState state;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Container(
        padding: PaddingsK.all16,
        margin: EdgeInsets.symmetric(
            vertical: state.modelEntity.value == model ? 2 : 5, horizontal: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          border: state.modelEntity.value == model
              ? Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 3,
                )
              : null,
          borderRadius: PaddingsK.circular10,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Text(
          model,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
