part of 'manage_car_bloc.dart';

@freezed
class ManageCarState with _$ManageCarState {
  const factory ManageCarState([
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(BrandEntityValidator.pure()) BrandEntityValidator brandEntity,
    @Default(ModelEntityValidator.pure()) ModelEntityValidator modelEntity,
    @Default(YearEntityValidator.pure()) YearEntityValidator yearEntity,
    @Default(PlateEntityValidator.pure()) PlateEntityValidator plateEntity,
    String? message,
  ]) = _ManageCarState;
}
