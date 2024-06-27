import 'package:bloc/bloc.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/domain/repositories/car_repository.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cars_bloc.freezed.dart';
part 'cars_event.dart';
part 'cars_state.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  final CarRepository _carRepository;
  CarsBloc(this._carRepository) : super(const _CarsState()) {
    on<_GetCars>(_onGetCars);
  }

  _onGetCars(_GetCars event, Emitter<CarsState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await _carRepository.getListOfCarsByUser();
    result.fold(
        (l) => emit(state.copyWith(
            message: l.message, status: FormzSubmissionStatus.failure)),
        (r) => emit(
            state.copyWith(carList: r, status: FormzSubmissionStatus.success)));
  }
}
