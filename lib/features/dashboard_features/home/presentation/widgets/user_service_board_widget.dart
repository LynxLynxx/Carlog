import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_entity.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class UserServiceBoardWidget extends StatelessWidget {
  const UserServiceBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingsK.h20,
      child: ListView(
        children: [
          TimelineWidget(
            isFirst: true,
            isLast: false,
            carActionEntity: CarActionEntity.example(),
          ),
          TimelineWidget(
            isFirst: false,
            isLast: false,
            carActionEntity: CarActionEntity.example(),
          ),
          TimelineWidget(
            isFirst: false,
            isLast: true,
            carActionEntity: CarActionEntity.example(),
          ),
        ],
      ),
    );
  }
}

class TimelineWidget extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final CarActionEntity carActionEntity;

  const TimelineWidget(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.carActionEntity});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      endChild: TimelineChildWidget(
        isFirst: isFirst,
        carActionEntity: carActionEntity,
      ),
    );
  }
}

class TimelineChildWidget extends StatelessWidget {
  final bool isFirst;
  final CarActionEntity carActionEntity;
  const TimelineChildWidget(
      {super.key, required this.isFirst, required this.carActionEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: dropShadowEffect().copyWith(
          color: isFirst ? context.onTertiary : context.primaryContainer,
          borderRadius: PaddingsK.circular30),
      margin: const EdgeInsets.only(left: 20, bottom: 30),
      height: 150,
      padding: PaddingsK.all16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "TODAY",
            style:
                context.titleLarge!.copyWith(color: context.onPrimaryContainer),
          ),
          Text(
            "19.06.2024",
            style:
                context.labelSmall!.copyWith(color: context.onPrimaryContainer),
          ),
          Text(
            "You don’t have an planned activity yet.",
            style:
                context.bodyMedium!.copyWith(color: context.onPrimaryContainer),
          ),
        ],
      ),
    );
  }
}
