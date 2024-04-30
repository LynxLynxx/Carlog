import 'package:carlog/shared/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

class CarlogLogoWidget extends StatelessWidget {
  const CarlogLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 130,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            const Positioned(
              top: -5,
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
            Positioned(
              top: 30,
              child: Image.asset(
                "assets/car_logo-min.png",
                width: MediaQuery.of(context).size.width * .75,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
