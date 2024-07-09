import 'package:carlog/core/constants/formats.dart';
import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_day_entity.dart';
import 'package:carlog/features/dashboard_features/home/presentation/widgets/timeline/service_activity_widget.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TimelineChildWidget extends StatelessWidget {
  final bool isFirst;
  final CarActionDayEntity carActionDayEntity;
  const TimelineChildWidget({
    super.key,
    required this.isFirst,
    required this.carActionDayEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: dropShadowEffect().copyWith(
          color: isFirst ? context.onTertiary : context.primaryContainer,
          borderRadius: PaddingsK.circular30),
      margin: EdgeInsets.only(left: 20, bottom: 15, top: isFirst ? 0 : 15),
      padding: PaddingsK.all24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    isFirst
                        ? S.of(context).today.toUpperCase()
                        : FormatsK.eeee.format(
                            DateTime.fromMillisecondsSinceEpoch(
                              carActionDayEntity.timestamp!,
                            ),
                          ),
                    style: context.titleLarge!
                        .copyWith(color: context.onPrimaryContainer),
                  ),
                  Text(
                    FormatsK.ddMMyyyy.format(
                      DateTime.fromMillisecondsSinceEpoch(
                        carActionDayEntity.timestamp!,
                      ),
                    ),
                    style: context.labelSmall!
                        .copyWith(color: context.onPrimaryContainer),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(carActionDayEntity.notificationActive!
                    ? ImagesK.bellFill
                    : ImagesK.bell),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          carActionDayEntity.carActions.isNotEmpty
              ? Column(
                  children: carActionDayEntity.carActions
                      .map((model) => ServiceActivityWidget(
                            carActionDayEntity: carActionDayEntity,
                            isFirst: isFirst,
                            index: 0,
                          ))
                      .toList(),
                )
              : Text(
                  S.of(context).youDontHaveAnPlannedActivity,
                  style: context.bodyMedium!
                      .copyWith(color: context.onPrimaryContainer),
                ),
        ],
      ),
    );
  }
}
