import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_entity.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceActivityWidget extends StatelessWidget {
  final bool isFirst;
  final CarActionEntity carActionEntity;

  const ServiceActivityWidget({
    super.key,
    required this.carActionEntity,
    required this.isFirst,
  });

  getIcon() {
    switch (carActionEntity.action) {
      case CarActionEnum.service:
        return ImagesK.service;
      case CarActionEnum.oilChange:
        return ImagesK.oilChange;
      case CarActionEnum.tireChange:
        return ImagesK.tireChange;
      case CarActionEnum.insurance:
        return ImagesK.insurance;
      case CarActionEnum.note:
        return ImagesK.note;
      default:
        return ImagesK.service;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: PaddingsK.h20,
      margin: PaddingsK.v5,
      decoration: dropShadowEffect(context).copyWith(
        color: isFirst ? context.primaryContainer : context.onSecondary,
        borderRadius: PaddingsK.circular30,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 35,
            child: SvgPicture.asset(
              getIcon(),
              width: 30,
              height: 30,
              colorFilter:
                  ColorFilter.mode(context.onPrimaryContainer, BlendMode.srcIn),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CarActionEnumExtension.getCustomName(carActionEntity.action),
                  style: context.titleMedium!.copyWith(
                    color: context.onPrimaryContainer,
                  ),
                ),
                Flexible(
                  child: Text(
                    carActionEntity.action != CarActionEnum.note
                        ? carActionEntity.address ?? ""
                        : carActionEntity.note ?? "",
                    style: context.labelSmall!.copyWith(
                      color: context.secondaryColor,
                    ),
                    maxLines: 2,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
