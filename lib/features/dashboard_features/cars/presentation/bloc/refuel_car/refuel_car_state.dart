part of 'refuel_car_bloc.dart';

@freezed
class RefuelCarState with _$RefuelCarState {
  const factory RefuelCarState([
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(MilageEntityValidator.pure()) MilageEntityValidator milageEntity,
    @Default(LitersEntityValidator.pure()) LitersEntityValidator litersEntity,
    @Default(PriceEntityValidator.pure()) PriceEntityValidator priceEntity,
    @Default(PricePerLiterEntityValidator.pure())
    PricePerLiterEntityValidator pricePerLiterEntity,
    String? message,
  ]) = _RefuelCarState;
}
