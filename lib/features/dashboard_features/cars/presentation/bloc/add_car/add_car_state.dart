part of 'add_car_bloc.dart';

@freezed
class AddCarState with _$AddCarState {
  const factory AddCarState([
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(BrandEntityValidator.pure()) BrandEntityValidator brandEntity,
    @Default('') String brandErrorMessage,
    @Default(ModelEntityValidator.pure()) ModelEntityValidator modelEntity,
    @Default('') String modelErrorMessage,
    @Default(YearEntityValidator.pure()) YearEntityValidator yearEntity,
    @Default('') String yearErrorMessage,
    @Default(PlateEntityValidator.pure()) PlateEntityValidator plateEntity,
    @Default('') String plateErrorMessage,
  ]) = _AddCarState;
}
