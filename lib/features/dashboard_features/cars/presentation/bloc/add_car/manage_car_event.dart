part of 'manage_car_bloc.dart';

@freezed
class ManageCarEvent with _$ManageCarEvent {
  const factory ManageCarEvent.brandChanged(String brand) = _BrandChanged;
  const factory ManageCarEvent.modelChanged(String model) = _ModelChanged;
  const factory ManageCarEvent.yearChanged(String year) = _YearChanged;
  const factory ManageCarEvent.plateChanged(String plate) = _PlateChanged;
  const factory ManageCarEvent.milageChanged(String milage) = _MilageChanged;
  const factory ManageCarEvent.carTypeChanged(CarTypeEnum carType) = _CarTypeChanged;
  const factory ManageCarEvent.fuelTypeChanged(FuelTypeEnum fuelType) = _FuelTypeChanged;
  const factory ManageCarEvent.engineCapacityChanged(String engineCapacity) = _EngineCapacityChanged;
  const factory ManageCarEvent.enginePowerChanged(String enginePower) = _EnginePowerChanged;
  const factory ManageCarEvent.submitCarBrand() = _SubmitCarBrand;
  const factory ManageCarEvent.submitCarModel() = _SubmitCarModel;
  const factory ManageCarEvent.submitCarMainInfo() = _SubmitCarMainInfo;
  const factory ManageCarEvent.submitCarSubMainInfo() = _SubmitCarSubMainInfo;
  const factory ManageCarEvent.setInitialCar(CarFirebaseEntity carFirebaseEntity) =
      _SetInitialCar;
  const factory ManageCarEvent.addCarSubmitted() = _AddCarSubmitted;
  const factory ManageCarEvent.editCarSubmitted() = _EditCarSubmitted;
  const factory ManageCarEvent.deleteCarSubmitted() = _DeleteCarSubmitted;
}
