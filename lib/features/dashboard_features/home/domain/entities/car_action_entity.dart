
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_action_entity.freezed.dart';
part 'car_action_entity.g.dart';

@freezed
class CarActionEntity with _$CarActionEntity {
  factory CarActionEntity({
    required int? timestamp,
    required String? latitude,
    required String? longitude,
    required CarActionEnum? action,
  }) = _CarActionEntity;

  factory CarActionEntity.example() => CarActionEntity(
        timestamp: 1719686401,
        latitude: '52.231889',
        longitude: '21.005980',
        action: CarActionEnum.service,
      );
	
  factory CarActionEntity.fromJson(Map<String, dynamic> json) =>
			_$CarActionEntityFromJson(json);
}
