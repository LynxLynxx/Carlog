import 'package:carlog/features/auth_features/shared/widgets/car_hero_widget.dart';
import 'package:carlog/shared/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

class CarlogLogoWidget extends StatelessWidget {
  const CarlogLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
              top: -10,
              child: GradientText(
                "CARLOG",
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(86, 117, 184, 1),
                    Color.fromRGBO(74, 74, 110, 1),
                  ],
                ),
                style: TextStyle(
                  fontFamily: "Futura",
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 20,
                ),
              ),
            ),
            CarHeroWidget(),
          ],
        ),
      ),
    );
  }
}
