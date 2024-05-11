import 'package:carlog/core/constants/animations.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UnknownErrorPage extends StatelessWidget {
  const UnknownErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            AnimationsK.unknownError,
            height: 400,
          ),
          Container(
            margin: PaddingsK.h30,
            child: const Text(
              "You're not supposed to be there",
              style: text22W700LS3,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
