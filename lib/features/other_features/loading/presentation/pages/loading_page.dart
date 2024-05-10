import 'package:carlog/features/auth_features/shared/widgets/car_hero_widget.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CarHeroWidget(),
      ),
    );
  }
}
