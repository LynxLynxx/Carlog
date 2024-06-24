part of 'basic_add_car_bloc.dart';

@freezed
class BasicAddCarState with _$BasicAddCarState {
  const factory BasicAddCarState(
      {@Default(0) int brandId,
      @Default(0) int modelId}) = _BasicAddCarState;
}
