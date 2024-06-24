import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_entity.freezed.dart';
part 'car_entity.g.dart';

@freezed
class CarEntity with _$CarEntity {
  factory CarEntity({
    required String brand,
    required String imageUrl,
    required List<String> models,
  }) = _CarEntity;

  factory CarEntity.fromJson(Map<String, dynamic> json) =>
      _$CarEntityFromJson(json);

  static List<CarEntity> fromMap(Map<String, dynamic> data) =>
      (data['data'] as List).map((json) => CarEntity.fromJson(json)).toList();
}
