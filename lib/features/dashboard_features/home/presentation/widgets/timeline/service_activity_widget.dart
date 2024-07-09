import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_day_entity.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceActivityWidget extends StatelessWidget {
  final bool isFirst;
  final CarActionDayEntity carActionDayEntity;
  final int index;
  const ServiceActivityWidget(
      {super.key,
      required this.carActionDayEntity,
      required this.isFirst,
      required this.index});

  getIcon(int index) {
    switch (carActionDayEntity.carActions[index].action) {
      case CarActionEnum.service:
        return "assets/icons/service.svg";
      case CarActionEnum.oilChange:
        return "assets/icons/oil_change.svg";
      case CarActionEnum.tireChange:
        return "assets/icons/tire_change.svg";
      case CarActionEnum.insurance:
        return "assets/icons/insurance.svg";
      default:
        return "assets/icons/service.svg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: PaddingsK.h20,
      margin: PaddingsK.v5,
      decoration: dropShadowEffect().copyWith(
        color: isFirst ? context.primaryContainer : context.onSecondary,
        borderRadius: PaddingsK.circular30,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            getIcon(index),
            width: 30,
            height: 30,
            colorFilter:
                ColorFilter.mode(context.onPrimaryContainer, BlendMode.srcIn),
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
                  CarActionEnumExtension.getCustomName(
                      carActionDayEntity.carActions[index].action),
                  style: context.titleMedium!.copyWith(
                    color: context.onPrimaryContainer,
                  ),
                ),
                Flexible(
                  child: Text(
                    carActionDayEntity.carActions[index].address ?? "",
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
