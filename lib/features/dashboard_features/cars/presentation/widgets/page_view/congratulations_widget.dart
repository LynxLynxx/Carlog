import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:flutter/material.dart';

class CongratulationsWidget extends StatelessWidget {
  const CongratulationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            "Congratulations!",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: context.onPrimaryContainer),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "You have successfully created your car!",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: context.onPrimaryContainer),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
