import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/brand_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/model_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/plate_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/year_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/repositories/car_repository.dart';
import 'package:carlog/generated/l10n.dart';
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
    final brand = BrandEntityValidator.pure(event.brand);
    emit(
      state.copyWith(brandEntity: brand),
    );
  }

  _onModelChanged(_ModelChanged event, Emitter<AddCarState> emit) {
    final model = ModelEntityValidator.pure(event.model);
    emit(
      state.copyWith(modelEntity: model),
    );
  }

  _onYearChanged(_YearChanged event, Emitter<AddCarState> emit) {
    final year = YearEntityValidator.pure(event.year);
    emit(
      state.copyWith(yearEntity: year),
    );
  }

  _onPlateChanged(_PlateChanged event, Emitter<AddCarState> emit) {
    final plate = PlateEntityValidator.pure(event.plate);
    emit(
      state.copyWith(plateEntity: plate),
    );
  }

  _onAddCarSubmitted(_AddCarSubmitted event, Emitter<AddCarState> emit) async {
    final brand = BrandEntityValidator.dirty(value: state.brandEntity.value);
    final model = ModelEntityValidator.dirty(value: state.modelEntity.value);
    final year = YearEntityValidator.dirty(value: state.yearEntity.value);
    final plate = PlateEntityValidator.dirty(value: state.plateEntity.value);

    if (!Formz.validate([brand, model, year, plate])) {
      return emit(state.copyWith(
          brandEntity: brand,
          modelEntity: model,
          yearEntity: year,
          plateEntity: plate,
          message: null));
    }

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

    emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        message: S.current.successfullyAddedTheVehicle));
  }
}
