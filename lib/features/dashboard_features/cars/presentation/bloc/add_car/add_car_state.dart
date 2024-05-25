part of 'add_car_bloc.dart';

@freezed
class AddCarState with _$AddCarState {
  const factory AddCarState([
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(BrandEntityValidator.pure()) BrandEntityValidator brandEntity,
    @Default(ModelEntityValidator.pure()) ModelEntityValidator modelEntity,
    @Default(YearEntityValidator.pure()) YearEntityValidator yearEntity,
    @Default(PlateEntityValidator.pure()) PlateEntityValidator plateEntity,
    String? message,
    @Default(false) bool buttonEnable,
  ]) = _AddCarState;
}
