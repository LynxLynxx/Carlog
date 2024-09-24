import 'package:bloc/bloc.dart';
import 'package:carlog/core/constants/durations.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/brand_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/engine_capacity_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/engine_power_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/milage_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/model_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/plate_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/year_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/usecases/add_car_usecase.dart';
import 'package:carlog/features/dashboard_features/cars/domain/usecases/delete_car_usecase.dart';
import 'package:carlog/features/dashboard_features/cars/domain/usecases/update_car_usecase.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_car_bloc.freezed.dart';
part 'manage_car_event.dart';
part 'manage_car_state.dart';

class ManageCarBloc extends Bloc<ManageCarEvent, ManageCarState> {
  final CarsBloc carsBloc;
  late String carId = "";
  final AddCarUsecase _addCarUsecase;
  final UpdateCarUsecase _updateCarUsecase;
  final DeleteCarUsecase _deleteCarUsecase;
  ManageCarBloc(this.carsBloc, this._addCarUsecase, this._updateCarUsecase,
      this._deleteCarUsecase)
      : super(const _ManageCarState()) {
    //Change the state
    on<_BrandChanged>(_onBrandChanged);
    on<_ModelChanged>(_onModelChanged);
    on<_YearChanged>(_onYearChanged);
    on<_MilageChanged>(_onMilageChanged);
    on<_PlateChanged>(_onPlateChanged);
    on<_CarTypeChanged>(_onCarTypeChanged);
    on<_FuelTypeChanged>(_onFuelTypeChanged);
    on<_EngineCapacityChanged>(_onEngineCapacityChanged);
    on<_EnginePowerChanged>(_onEnginePowerChanged);
    //Submit the form
    on<_SubmitCarBrand>(_onSubmitCarBrand);
    on<_SubmitCarModel>(_onSubmitCarModel);
    on<_SubmitCarMainInfo>(_onSubmitCarMainInfo);
    on<_SubmitCarSubMainInfo>(_onSubmitCarSubMainInfo);
    //Other
    on<_SetInitialCar>(_onSetInitialCar);
    on<_AddCarSubmitted>(_onAddCarSubmitted);
    on<_EditCarSubmitted>(_onEditCarSubmitted);
    on<_DeleteCarSubmitted>(_onDeleteCarSubmitted);
  }

  _onBrandChanged(_BrandChanged event, Emitter<ManageCarState> emit) {
    final brand = BrandEntityValidator.pure(event.brand);
    emit(
      state.copyWith(brandEntity: brand),
    );
  }

  _onModelChanged(_ModelChanged event, Emitter<ManageCarState> emit) {
    final model = ModelEntityValidator.pure(event.model);
    emit(
      state.copyWith(modelEntity: model),
    );
  }

  _onYearChanged(_YearChanged event, Emitter<ManageCarState> emit) {
    final year = YearEntityValidator.pure(event.year);
    emit(
      state.copyWith(yearEntity: year),
    );
  }

  _onMilageChanged(_MilageChanged event, Emitter<ManageCarState> emit) {
    final milage = MilageEntityValidator.pure(event.milage);
    emit(
      state.copyWith(milageEntity: milage),
    );
  }

  _onPlateChanged(_PlateChanged event, Emitter<ManageCarState> emit) {
    final plate = PlateEntityValidator.pure(event.plate);
    emit(
      state.copyWith(plateEntity: plate),
    );
  }

  _onCarTypeChanged(_CarTypeChanged event, Emitter<ManageCarState> emit) {
    emit(
      state.copyWith(typeEntity: event.carType),
    );
  }

  _onFuelTypeChanged(_FuelTypeChanged event, Emitter<ManageCarState> emit) {
    emit(
      state.copyWith(fuelTypeEntity: event.fuelType),
    );
  }

  _onEngineCapacityChanged(
      _EngineCapacityChanged event, Emitter<ManageCarState> emit) {
    final engineCapacity =
        EngineCapacityEntityValidator.pure(event.engineCapacity);
    emit(
      state.copyWith(engineCapacityEntity: engineCapacity),
    );
  }

  _onEnginePowerChanged(
      _EnginePowerChanged event, Emitter<ManageCarState> emit) {
    final enginePower = EnginePowerEntityValidator.pure(event.enginePower);
    emit(
      state.copyWith(enginePowerEntity: enginePower),
    );
  }

  _onSubmitCarBrand(_SubmitCarBrand event, Emitter<ManageCarState> emit) async {
    final brand = BrandEntityValidator.dirty(value: state.brandEntity.value);

    if (!Formz.validate([brand])) {
      return emit(state.copyWith(
        brandEntity: brand,
        message: null,
      ));
    }

    emit(state.copyWith(
        status: FormzSubmissionStatus.success, isButtonActive: false));
    await Future.delayed(DurationsK.d350);
    return emit(state.copyWith(
        status: FormzSubmissionStatus.inProgress, isButtonActive: true));
  }

  _onSubmitCarModel(_SubmitCarModel event, Emitter<ManageCarState> emit) async {
    final model = ModelEntityValidator.dirty(value: state.modelEntity.value);

    if (!Formz.validate([model])) {
      return emit(state.copyWith(modelEntity: model, message: null));
    }

    emit(state.copyWith(
        status: FormzSubmissionStatus.success, isButtonActive: false));
    await Future.delayed(DurationsK.d350);
    return emit(state.copyWith(
        status: FormzSubmissionStatus.inProgress, isButtonActive: true));
  }

  _onSubmitCarMainInfo(
      _SubmitCarMainInfo event, Emitter<ManageCarState> emit) async {
    final year = YearEntityValidator.dirty(value: state.yearEntity.value);
    final milage = MilageEntityValidator.dirty(value: state.milageEntity.value);
    final plate = PlateEntityValidator.dirty(value: state.plateEntity.value);

    if (!Formz.validate([year, milage, plate])) {
      return emit(state.copyWith(
          yearEntity: year,
          milageEntity: milage,
          plateEntity: plate,
          message: null));
    }

    emit(state.copyWith(
        status: FormzSubmissionStatus.success, isButtonActive: false));
    await Future.delayed(DurationsK.d1000);
    return emit(state.copyWith(
        status: FormzSubmissionStatus.inProgress, isButtonActive: true));
  }

  _onSubmitCarSubMainInfo(
      _SubmitCarSubMainInfo event, Emitter<ManageCarState> emit) async {
    final capacity = EngineCapacityEntityValidator.dirty(
        value: state.engineCapacityEntity.value);
    final power =
        EnginePowerEntityValidator.dirty(value: state.enginePowerEntity.value);

    if (!Formz.validate([capacity, power])) {
      return emit(state.copyWith(
          engineCapacityEntity: capacity,
          enginePowerEntity: power,
          message: null));
    }

    emit(state.copyWith(
        status: FormzSubmissionStatus.success, isButtonActive: false));
    await Future.delayed(DurationsK.d1000);
    return emit(state.copyWith(
        status: FormzSubmissionStatus.inProgress, isButtonActive: true));
  }

  _onSetInitialCar(_SetInitialCar event, Emitter<ManageCarState> emit) {
    final brand =
        BrandEntityValidator.dirty(value: event.carFirebaseEntity.brand ?? "");
    final model =
        ModelEntityValidator.dirty(value: event.carFirebaseEntity.model ?? "");
    final year =
        YearEntityValidator.dirty(value: event.carFirebaseEntity.year ?? "");
    final milage = MilageEntityValidator.dirty(
        value: event.carFirebaseEntity.milage.toString());
    final plate =
        PlateEntityValidator.dirty(value: event.carFirebaseEntity.plate ?? "");
    final carType = event.carFirebaseEntity.carType ?? "";
    final fuelType = event.carFirebaseEntity.fuelType ?? "";

    final engineCapacity = EngineCapacityEntityValidator.dirty(
        value: event.carFirebaseEntity.engineCapacity ?? "");
    final enginePower = EnginePowerEntityValidator.dirty(
        value: event.carFirebaseEntity.enginePower ?? "");

    carId = event.carFirebaseEntity.carId;
    emit(
      state.copyWith(
        brandEntity: brand,
        modelEntity: model,
        yearEntity: year,
        milageEntity: milage,
        plateEntity: plate,
        typeEntity: CarTypeEnumExtension.fromString(carType),
        fuelTypeEntity: FuelTypeEnumExtension.fromString(fuelType),
        engineCapacityEntity: engineCapacity,
        enginePowerEntity: enginePower,
      ),
    );
  }

  _onAddCarSubmitted(
      _AddCarSubmitted event, Emitter<ManageCarState> emit) async {
    final brand = BrandEntityValidator.dirty(value: state.brandEntity.value);
    final model = ModelEntityValidator.dirty(value: state.modelEntity.value);
    final year = YearEntityValidator.dirty(value: state.yearEntity.value);
    final milage = MilageEntityValidator.dirty(value: state.milageEntity.value);
    final plate = PlateEntityValidator.dirty(value: state.plateEntity.value);
    final engineCapacity = EngineCapacityEntityValidator.dirty(
        value: state.engineCapacityEntity.value);
    final enginePower =
        EnginePowerEntityValidator.dirty(value: state.enginePowerEntity.value);

    if (!Formz.validate(
        [brand, model, year, milage, plate, engineCapacity, enginePower])) {
      return emit(
        state.copyWith(
          brandEntity: brand,
          modelEntity: model,
          yearEntity: year,
          milageEntity: milage,
          plateEntity: plate,
          engineCapacityEntity: engineCapacity,
          enginePowerEntity: enginePower,
          message: null,
        ),
      );
    }

    final result = await _addCarUsecase.call(
      CarFirebaseEntity(
        carId: "",
        brand: state.brandEntity.value != "" ? state.brandEntity.value : null,
        model: state.modelEntity.value != "" ? state.modelEntity.value : null,
        year: state.yearEntity.value != "" ? state.yearEntity.value : null,
        plate: state.plateEntity.value != "" ? state.plateEntity.value : null,
        milage: state.milageEntity.value != ""
            ? int.tryParse(state.milageEntity.value)
            : null,
        carType: state.typeEntity?.name != "" ? state.typeEntity?.name : null,
        fuelType: state.fuelTypeEntity?.name != ""
            ? state.fuelTypeEntity?.name
            : null,
        engineCapacity: state.engineCapacityEntity.value != ""
            ? state.engineCapacityEntity.value
            : null,
        enginePower: state.enginePowerEntity.value != ""
            ? state.enginePowerEntity.value
            : null,
      ),
    );

    if (result.isSome()) {
      return emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: result.asOption().message!));
    }

    emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        message: S.current.successfullyAddedTheVehicle));
    carsBloc.add(const CarsEvent.getCars());
  }

  _onEditCarSubmitted(
      _EditCarSubmitted event, Emitter<ManageCarState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final brand = BrandEntityValidator.dirty(value: state.brandEntity.value);
    final model = ModelEntityValidator.dirty(value: state.modelEntity.value);
    final year = YearEntityValidator.dirty(value: state.yearEntity.value);
    final milage = MilageEntityValidator.dirty(value: state.milageEntity.value);
    final plate = PlateEntityValidator.dirty(value: state.plateEntity.value);
    final engineCapacity = EngineCapacityEntityValidator.dirty(
        value: state.engineCapacityEntity.value);
    final enginePower =
        EnginePowerEntityValidator.dirty(value: state.enginePowerEntity.value);

    if (!Formz.validate(
        [brand, model, year, milage, plate, engineCapacity, enginePower])) {
      return emit(
        state.copyWith(
          brandEntity: brand,
          modelEntity: model,
          yearEntity: year,
          milageEntity: milage,
          plateEntity: plate,
          engineCapacityEntity: engineCapacity,
          enginePowerEntity: enginePower,
          message: null,
        ),
      );
    }

    final result = await _updateCarUsecase.call(
      CarFirebaseEntity(
        carId: carId,
        brand: state.brandEntity.value != "" ? state.brandEntity.value : null,
        model: state.modelEntity.value != "" ? state.modelEntity.value : null,
        year: state.yearEntity.value != "" ? state.yearEntity.value : null,
        plate: state.plateEntity.value != "" ? state.plateEntity.value : null,
        milage: state.milageEntity.value != ""
            ? int.tryParse(state.milageEntity.value)
            : null,
        carType: state.typeEntity?.name != "" ? state.typeEntity?.name : null,
        fuelType: state.fuelTypeEntity?.name != ""
            ? state.fuelTypeEntity?.name
            : null,
        engineCapacity: state.engineCapacityEntity.value != ""
            ? state.engineCapacityEntity.value
            : null,
        enginePower: state.enginePowerEntity.value != ""
            ? state.enginePowerEntity.value
            : null,
      ),
    );

    if (result.isSome()) {
      return emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: result.asOption().message!));
    }

    emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        message: S.current.successfullyEditedTheVehicle));
    carsBloc.add(const CarsEvent.getCars());
  }

  _onDeleteCarSubmitted(
      _DeleteCarSubmitted event, Emitter<ManageCarState> emit) async {
    final result = await _deleteCarUsecase.call(
      carId,
    );

    if (result.isSome()) {
      return emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: result.asOption().message!));
    }

    emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        message: S.current.successfullyDeletedTheVehicle));
    carsBloc.add(const CarsEvent.getCars());
  }

  bool get isRequiredFieldsFilled =>
      state.brandEntity.value.isNotEmpty &&
      state.modelEntity.value.isNotEmpty &&
      state.yearEntity.value.isNotEmpty &&
      state.milageEntity.value.isNotEmpty;
}
