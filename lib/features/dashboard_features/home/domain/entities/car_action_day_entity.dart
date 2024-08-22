import 'package:carlog/core/converters/timestamp_converter.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_action_day_entity.freezed.dart';
part 'car_action_day_entity.g.dart';

@freezed
class CarActionDayEntity with _$CarActionDayEntity {
  factory CarActionDayEntity({
    @TimestampConverter() DateTime? timestamp,
    required bool? notificationActive,
    required List<CarActionEntity> carActions,
    required String? carId,
    required String actionId,
  }) = _CarActionDayEntity;

  factory CarActionDayEntity.example() => CarActionDayEntity(
        timestamp: DateTime.fromMillisecondsSinceEpoch(1719686401),
        notificationActive: true,
        carActions: [CarActionEntity.example(), CarActionEntity.example()],
        carId: "Psi7UTfL47sgp1usWGn3",
        actionId: "5l2HyY8WULdn6yYBx8kR",
      );

  factory CarActionDayEntity.fromJson(Map<String, dynamic> json) =>
      _$CarActionDayEntityFromJson(json);
}
