import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/gorouter_extension.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:flutter/material.dart';

class AddCarListElementWidget extends StatelessWidget {
  const AddCarListElementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushAndTrack(RoutesK.addCar.fullPath, extra: context),
      child: Padding(
        padding: PaddingsK.h30v10,
        child: Card(
          child:
              Container(margin: PaddingsK.all16, child: const Icon(Icons.add)),
        ),
      ),
    );
  }
}
