import 'package:carlog/core/constants/animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CarHeroWidget extends StatelessWidget {
  const CarHeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "car_hero",
      child: LottieBuilder.asset(
        AnimationsK.drivingCar,
      ),
    );
  }
}
