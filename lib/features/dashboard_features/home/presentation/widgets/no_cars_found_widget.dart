import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/widgets/cars/car_list_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';

class NoCarsFoundWidget extends StatelessWidget {
  const NoCarsFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          height: 100,
          child: AddCarListElementWidget(),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          S.of(context).youHaveNoCarsYet,
          style: context.titleLarge,
        ),
      ],
    );
  }
}
