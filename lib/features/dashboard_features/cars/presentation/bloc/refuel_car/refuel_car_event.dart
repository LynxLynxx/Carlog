part of 'refuel_car_bloc.dart';

@freezed
class RefuelCarEvent with _$RefuelCarEvent {
  const factory RefuelCarEvent.litersChanged(String liters) = _LitersChanged;
  const factory RefuelCarEvent.milageChanged(String milage) = _MilageChanged;
  const factory RefuelCarEvent.priceChanged(String price) = _PriceChanged;
  const factory RefuelCarEvent.pricePerLiterChanged(String pricePerLiter) =
      _PricePerLiterChanged;
  const factory RefuelCarEvent.addCarSubmitted() = _AddRefuelSubmitted;
}
