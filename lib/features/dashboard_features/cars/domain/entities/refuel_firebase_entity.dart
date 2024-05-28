
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refuel_firebase_entity.freezed.dart';
part 'refuel_firebase_entity.g.dart';

@freezed
class RefuelFirebaseEntity with _$RefuelFirebaseEntity {
  factory RefuelFirebaseEntity({
    required String refuelId,
    required String carId,
    required String userId,
    required int? liters,
    required int? milage,
    required double? price,
    required double? pricePerLiter,
  }) = _RefuelFirebaseEntity;
	
  factory RefuelFirebaseEntity.fromJson(Map<String, dynamic> json) =>
			_$RefuelFirebaseEntityFromJson(json);
}
