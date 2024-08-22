import 'package:carlog/core/converters/timestamp_converter.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_action_entity.freezed.dart';
part 'car_action_entity.g.dart';

@freezed
class CarActionEntity with _$CarActionEntity {
  factory CarActionEntity({
    required String carActionId,
    @TimestampConverter() DateTime? timestamp,
    required String? latitude,
    required String? longitude,
    required String? address,
    required String? note,
    required CarActionEnum? action,
  }) = _CarActionEntity;

  factory CarActionEntity.example() => CarActionEntity(
        carActionId: "9f9342df-8cb8-424b-8301-fcd269048f4a",
        timestamp: DateTime.fromMillisecondsSinceEpoch(1719686401),
        latitude: '52.231889',
        longitude: '21.005980',
        address: "Marszałkowska 1, 00-068 Warszawa, Polska",
        note: "Note",
        action: CarActionEnum.service,
      );

  factory CarActionEntity.fromJson(Map<String, dynamic> json) =>
      _$CarActionEntityFromJson(json);
}
