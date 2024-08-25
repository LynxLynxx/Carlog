import 'package:auto_size_text/auto_size_text.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarListElementWidget extends StatelessWidget {
  final CarFirebaseEntity carEntity;
  const CarListElementWidget({super.key, required this.carEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(RoutesK.manageCar.fullPath, extra: {
        "carFirebaseEntity": carEntity,
        "appContext": context,
      }),
      child: Container(
        decoration:
            dropShadowEffect(context).copyWith(color: context.primaryContainer),
        margin: PaddingsK.all16,
        padding: PaddingsK.all24,
        height: 150,
        child: Stack(
          children: [
            Container(
              constraints: const BoxConstraints(minWidth: 125),
              decoration: BoxDecoration(
                  borderRadius: PaddingsK.circular10,
                  color: context.onSecondary),
              padding: PaddingsK.h20v10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    carEntity.brand ?? "Skoda",
                    style: context.titleLarge,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    carEntity.model ?? "Octavia",
                    style: context.labelSmall,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/car_sedan.png",
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AutoSizeText(
                      carEntity.fuelType ?? "Hybrid",
                      style: context.titleLarge,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      carEntity.carType ?? "Sedan",
                      style: context.bodySmall,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      carEntity.milage.toString(),
                      style: context.labelLarge,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
