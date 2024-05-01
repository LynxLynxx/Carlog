import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.85),
      body: Center(
        child: LottieBuilder.asset("assets/car_lottie.json"),
      ),
    );
  }
}
