import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_firebase_entity.freezed.dart';
part 'car_firebase_entity.g.dart';

@freezed
class CarFirebaseEntity with _$CarFirebaseEntity {
  factory CarFirebaseEntity({
    required String carId,
    required String? brand,
    required String? model,
    required int? year,
    required String? plate,
  }) = _CarFirebaseEntity;

  factory CarFirebaseEntity.fromJson(Map<String, dynamic> json) =>
      _$CarFirebaseEntityFromJson(json);
}