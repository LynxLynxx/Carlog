import 'package:bloc/bloc.dart';
import 'package:carlog/features/dashboard_features/cars/domain/repositories/car_repository.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_day_entity.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_bloc.freezed.dart';
part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final CarRepository _carRepository;
  ServiceBloc(this._carRepository) : super(const _ServiceState()) {
    on<_GetServices>(_onGetServices);
  }

  _onGetServices(_GetServices event, Emitter<ServiceState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result =
        await _carRepository.getCarActionsByCarId("Psi7UTfL47sgp1usWGn3");
    result.fold(
        (l) => emit(state.copyWith(
            message: l.toString(), status: FormzSubmissionStatus.failure)),
        (r) => emit(state.copyWith(
            carActionDayEntity: r, status: FormzSubmissionStatus.success)));
  }
}
