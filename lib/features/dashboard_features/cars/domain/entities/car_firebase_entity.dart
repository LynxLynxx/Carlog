import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_firebase_entity.freezed.dart';
part 'car_firebase_entity.g.dart';

@freezed
class CarFirebaseEntity with _$CarFirebaseEntity {
  factory CarFirebaseEntity({
    required String carId,
    String? brand,
    String? model,
    String? year,
    String? plate,
    String? milage,
    String? carType,
    String? fuelType,
    String? engineCapacity,
    String? enginePower,
  }) = _CarFirebaseEntity;

  factory CarFirebaseEntity.fromJson(Map<String, dynamic> json) =>
      _$CarFirebaseEntityFromJson(json);
}
