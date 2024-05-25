part of 'add_car_bloc.dart';

@freezed
class AddCarEvent with _$AddCarEvent {
  const factory AddCarEvent.brandChanged(String brand) = _BrandChanged;
  const factory AddCarEvent.modelChanged(String model) = _ModelChanged;
  const factory AddCarEvent.yearChanged(String year) = _YearChanged;
  const factory AddCarEvent.plateChanged(String plate) = _PlateChanged;
  const factory AddCarEvent.addCarSubmitted() = _AddCarSubmitted;
}
