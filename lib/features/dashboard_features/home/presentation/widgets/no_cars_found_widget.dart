import 'package:carlog/core/constants/animations.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/cars/add_car_list_element_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoCarsFoundWidget extends StatelessWidget {
  const NoCarsFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          AnimationsK.carGarage,
          width: double.infinity,
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          width: double.infinity,
          height: 100,
          child: AddCarListElementWidget(),
        ),
      ],
    );
  }
}
