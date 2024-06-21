import 'package:carlog/core/constants/jsons.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/custom_alphabet_scroll.dart';
import 'package:flutter/material.dart';

class PickCarBrandWidget extends StatelessWidget {
  const PickCarBrandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final carList = CarEntity.fromMap(JsonsK.cars);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: CustomAlphabetScroll(
            list: carList,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Unable to locate your brand?",
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
