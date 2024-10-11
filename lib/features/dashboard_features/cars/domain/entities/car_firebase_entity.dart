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
    num? milage,
    String? carType,
    String? fuelType,
    String? engineCapacity,
    String? enginePower,
  }) = _CarFirebaseEntity;

  factory CarFirebaseEntity.empty() => CarFirebaseEntity(
        carId: '1',
        brand: '',
        model: '',
        year: '',
        plate: '',
        milage: 0,
        carType: '',
        fuelType: '',
        engineCapacity: '',
        enginePower: '',
      );
  factory CarFirebaseEntity.example() => CarFirebaseEntity(
        carId: '1',
        brand: 'Audi',
        model: 'A4',
        year: '2010',
        plate: 'WZ 12345',
        milage: 100000,
        carType: 'Sedan',
        fuelType: 'Diesel',
        engineCapacity: '2000',
        enginePower: '140',
      );

  factory CarFirebaseEntity.fromJson(Map<String, dynamic> json) =>
      _$CarFirebaseEntityFromJson(json);
}
