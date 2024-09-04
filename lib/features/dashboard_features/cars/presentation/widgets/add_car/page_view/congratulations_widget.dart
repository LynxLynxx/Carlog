import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';

class CongratulationsWidget extends StatelessWidget {
  const CongratulationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: 150,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            S.of(context).congratulations,
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
            S.of(context).youHaveSuccessfullyCreatedYourCar,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: context.onPrimaryContainer),
          ),
        ),
      ],
    );
  }
}
