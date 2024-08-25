import 'package:bloc/bloc.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/domain/usecases/get_cars_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cars_bloc.freezed.dart';
part 'cars_event.dart';
part 'cars_state.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  final GetCarsUsecase _getCarsUsecase;
  CarsBloc(this._getCarsUsecase) : super(const _Initial()) {
    on<_GetCars>(_onGetCars);
  }

  _onGetCars(_GetCars event, Emitter<CarsState> emit) async {
    emit(const _Loading());
    final result = await _getCarsUsecase.call();
    result.fold((l) => emit(_Failure(l)), (r) => emit(_Data(r)));
  }
}
