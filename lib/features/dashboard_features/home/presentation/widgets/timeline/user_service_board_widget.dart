import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_day_entity.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/timeline/timeline_widget.dart';
import 'package:flutter/material.dart';

class UserServiceBoardWidget extends StatelessWidget {
  const UserServiceBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingsK.h20,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TimelineWidget(
            isFirst: true,
            isLast: false,
            carActionDayEntity: CarActionDayEntity.example(),
          ),
          TimelineWidget(
            isFirst: false,
            isLast: false,
            carActionDayEntity: CarActionDayEntity.example(),
          ),
          TimelineWidget(
            isFirst: false,
            isLast: true,
            carActionDayEntity: CarActionDayEntity.example(),
          ),
        ],
      ),
    );
  }
}
