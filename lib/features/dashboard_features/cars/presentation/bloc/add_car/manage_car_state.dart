// ignore_for_file: constant_identifier_names

part of 'manage_car_bloc.dart';

enum CarTypeEnum {
  Bus,
  Cabriolet,
  Campervan,
  Coupe,
  Cuv,
  Hatchback,
  Limousine,
  Micro,
  Minivan,
  Muscle,
  Pickup,
  Roadster,
  Sedan,
  Sport,
  Suv,
  Super,
  Truck,
  Van
}

enum FuelTypeEnum {
  Gasoline,
  Diesel,
  Hybrid,
  PlugInHybrid,
  Electric,
  CNG,
  LPG,
  Hydrogen,
  Biodiesel,
  E85
}

@freezed
class ManageCarState with _$ManageCarState {
  const factory ManageCarState([
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(BrandEntityValidator.pure()) BrandEntityValidator brandEntity,
    @Default(ModelEntityValidator.pure()) ModelEntityValidator modelEntity,
    @Default(YearEntityValidator.pure()) YearEntityValidator yearEntity,
    @Default(PlateEntityValidator.pure()) PlateEntityValidator plateEntity,
    @Default(MilageEntityValidator.pure()) MilageEntityValidator milageEntity,
    CarTypeEnum? typeEntity,
    FuelTypeEnum? fuelTypeEntity,
    @Default(EngineCapacityEntityValidator.pure())
    EngineCapacityEntityValidator engineCapacityEntity,
    @Default(EnginePowerEntityValidator.pure())
    EnginePowerEntityValidator enginePowerEntity,
    String? message,
    @Default(true) bool isButtonActive,
  ]) = _ManageCarState;
}
