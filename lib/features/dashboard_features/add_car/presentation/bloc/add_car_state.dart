part of 'add_car_bloc.dart';

@freezed
class AddCarState with _$AddCarState {
  const factory AddCarState(
      {@Default(0) int brandId,
      @Default(0) int modelId}) = _AddCarState;
}
