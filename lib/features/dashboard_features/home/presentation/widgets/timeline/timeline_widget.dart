import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_entity.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/timeline/timeline_child_widget.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

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
      beforeLineStyle: LineStyle(
        color: context.primaryColor,
        thickness: 3,
      ),
      indicatorStyle: IndicatorStyle(
        padding: PaddingsK.v20,
        iconStyle: IconStyle(
          iconData: isFirst ? Icons.radio_button_checked : Icons.calendar_today,
          fontSize: 30,
        ),
        color: context.surfaceColor,
      ),
      endChild: TimelineChildWidget(
        isFirst: isFirst,
        carActionEntity: carActionEntity,
      ),
    );
  }
}
