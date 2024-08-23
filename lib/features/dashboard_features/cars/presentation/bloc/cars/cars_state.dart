part of 'cars_bloc.dart';

@freezed
class CarsState with _$CarsState {
  const factory CarsState.initial() = _Initial;
  const factory CarsState.loading() = _Loading;
  const factory CarsState.data(final List<CarFirebaseEntity> carList) = _Data;
  const factory CarsState.failure(final Failure failure) = _Failure;
}
