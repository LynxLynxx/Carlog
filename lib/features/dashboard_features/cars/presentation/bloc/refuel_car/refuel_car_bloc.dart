import 'package:bloc/bloc.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/liters_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/milage_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/price_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/price_per_liter_entity_validator.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refuel_car_bloc.freezed.dart';
part 'refuel_car_event.dart';
part 'refuel_car_state.dart';

class RefuelCarBloc extends Bloc<RefuelCarEvent, RefuelCarState> {
  RefuelCarBloc() : super(const _RefuelCarState()) {
    on<_LitersChanged>(_onLitersChanged);
    on<_MilageChanged>(_onMilageChanged);
    on<_PriceChanged>(_onPriceChanged);
    on<_PricePerLiterChanged>(_onPricePerLiterChanged);
    on<_AddRefuelSubmitted>(_onAddRefuelSubmitted);
  }

  _onLitersChanged(_LitersChanged event, Emitter<RefuelCarState> emit) {
    final liters = LitersEntityValidator.pure(event.liters);
    emit(
      state.copyWith(litersEntity: liters),
    );
  }

  _onMilageChanged(_MilageChanged event, Emitter<RefuelCarState> emit) {
    final milage = MilageEntityValidator.pure(event.milage);
    emit(
      state.copyWith(milageEntity: milage),
    );
  }

  _onPriceChanged(_PriceChanged event, Emitter<RefuelCarState> emit) {
    final price = PriceEntityValidator.pure(event.price);
    emit(
      state.copyWith(priceEntity: price),
    );
  }

  _onPricePerLiterChanged(
      _PricePerLiterChanged event, Emitter<RefuelCarState> emit) {
    final pricePerLiter =
        PricePerLiterEntityValidator.pure(event.pricePerLiter);
    emit(
      state.copyWith(pricePerLiterEntity: pricePerLiter),
    );
  }

  _onAddRefuelSubmitted(
      _AddRefuelSubmitted event, Emitter<RefuelCarState> emit) async {
    final liters = LitersEntityValidator.dirty(value: state.litersEntity.value);
    final milage = MilageEntityValidator.dirty(value: state.milageEntity.value);
    final price = PriceEntityValidator.dirty(value: state.priceEntity.value);
    final pricePerLiter = PricePerLiterEntityValidator.dirty(
        value: state.pricePerLiterEntity.value);

    if (!Formz.validate([liters, milage, price, pricePerLiter])) {
      return emit(state.copyWith(
          litersEntity: liters,
          milageEntity: milage,
          priceEntity: price,
          pricePerLiterEntity: pricePerLiter,
          message: null));
    }

    // final result = await _carRepository.createCarByUser(
    //     state.brandEntity.value,
    //     state.modelEntity.value,
    //     state.yearEntity.value,
    //     state.plateEntity.value);

    // if (result.isSome()) {
    //   return emit(state.copyWith(
    //       status: FormzSubmissionStatus.failure,
    //       message: result.asOption().message!));
    // }

    // emit(state.copyWith(
    //     status: FormzSubmissionStatus.success,
    //     message: S.current.successfullyAddedTheVehicle));
    // carsBloc.add(const CarsEvent.getCars());
  }
}
