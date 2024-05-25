import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/brand_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/model_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/plate_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/year_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/repositories/car_repository.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_car_bloc.freezed.dart';
part 'add_car_event.dart';
part 'add_car_state.dart';

class AddCarBloc extends Bloc<AddCarEvent, AddCarState> {
  final CarRepository _carRepository;
  AddCarBloc(this._carRepository) : super(const _AddCarState()) {
    on<_BrandChanged>(_onBrandChanged);
    on<_ModelChanged>(_onModelChanged);
    on<_YearChanged>(_onYearChanged);
    on<_PlateChanged>(_onPlateChanged);
    on<_AddCarSubmitted>(_onAddCarSubmitted);
  }

  _onBrandChanged(_BrandChanged event, Emitter<AddCarState> emit) {
    final brand = BrandEntityValidator.dirty(event.brand);
    String brandError = "";
    if (brand.displayError != null) {
      brandError = brand.displayError!;
    }
    emit(
      state.copyWith(brandEntity: brand, brandErrorMessage: brandError),
    );
  }

  _onModelChanged(_ModelChanged event, Emitter<AddCarState> emit) {
    final model = ModelEntityValidator.dirty(event.model);
    String modelError = "";
    if (model.displayError != null) {
      modelError = model.displayError!;
    }
    emit(
      state.copyWith(modelEntity: model, brandErrorMessage: modelError),
    );
  }

  _onYearChanged(_YearChanged event, Emitter<AddCarState> emit) {
    final year = YearEntityValidator.dirty(event.year);
    String yearError = "";
    if (year.displayError != null) {
      yearError = year.displayError!;
    }
    emit(
      state.copyWith(yearEntity: year, yearErrorMessage: yearError),
    );
  }

  _onPlateChanged(_PlateChanged event, Emitter<AddCarState> emit) {
    final plate = PlateEntityValidator.dirty(event.plate);
    String plateError = "";
    if (plate.displayError != null) {
      plateError = plate.displayError!;
    }
    emit(
      state.copyWith(plateEntity: plate, plateErrorMessage: plateError),
    );
  }

  _onAddCarSubmitted(_AddCarSubmitted event, Emitter<AddCarState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    if ((state.brandErrorMessage.isEmpty) &&
        state.modelErrorMessage.isEmpty &&
        state.yearErrorMessage.isEmpty &&
        state.plateErrorMessage.isEmpty) {
      final result = await _carRepository.createCarByUser(
          state.brandEntity.value,
          state.modelEntity.value,
          state.yearEntity.value,
          state.plateEntity.value);

      if (result.isSome()) {
        return emit(state.copyWith(
            status: FormzSubmissionStatus.failure,
            message: result.asOption().message!));
      }

      return emit(state.copyWith(
          status: FormzSubmissionStatus.success, message: "Success"));
    }
    return emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        message: "An error has occured"));
  }
}
