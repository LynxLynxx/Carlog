import 'package:carlog/core/constants/animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CarlogLoader extends StatelessWidget {
  const CarlogLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: MediaQuery.of(context).size.height - 300,
              alignment: Alignment.center,
              child: LottieBuilder.asset(AnimationsK.drivingCar),
            );
  }
}