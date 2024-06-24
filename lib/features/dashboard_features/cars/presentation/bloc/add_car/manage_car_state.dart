part of 'manage_car_bloc.dart';

@freezed
class ManageCarState with _$ManageCarState {
  const factory ManageCarState([
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(BrandEntityValidator.pure()) BrandEntityValidator brandEntity,
    @Default(ModelEntityValidator.pure()) ModelEntityValidator modelEntity,
    @Default(YearEntityValidator.pure()) YearEntityValidator yearEntity,
    @Default(PlateEntityValidator.pure()) PlateEntityValidator plateEntity,
    @Default(MilageEntityValidator.pure()) MilageEntityValidator milageEntity,
    @Default(CarTypeEntityValidator.pure()) CarTypeEntityValidator typeEntity,
    @Default(FuelTypeEntityValidator.pure())
    FuelTypeEntityValidator fuelTypeEntity,
    @Default(EngineCapacityEntityValidator.pure())
    EngineCapacityEntityValidator engineCapacityEntity,
    @Default(EnginePowerEntityValidator.pure())
    EnginePowerEntityValidator enginePowerEntity,
    String? message,
    @Default(true) bool isButtonActive,
  ]) = _ManageCarState;
}
