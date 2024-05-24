part of 'cars_bloc.dart';

@freezed
class CarsEvent with _$CarsEvent {
  const factory CarsEvent.started() = _Started;
}