import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_firebase_entity.freezed.dart';
part 'car_firebase_entity.g.dart';

@freezed
class CarFirebaseEntity with _$CarFirebaseEntity {
  factory CarFirebaseEntity({
    required String carId,
    String? brand,
    String? model,
    int? year,
    String? plate,
    int? milage,
    String? carType,
    String? fuelType,
    int? engineCapacity,
    int? enginePower,
  }) = _CarFirebaseEntity;

  factory CarFirebaseEntity.fromJson(Map<String, dynamic> json) =>
      _$CarFirebaseEntityFromJson(json);
}
