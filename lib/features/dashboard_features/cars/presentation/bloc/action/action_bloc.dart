import 'package:bloc/bloc.dart';
import 'package:carlog/features/dashboard_features/cars/domain/repositories/car_repository.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_day_entity.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_bloc.freezed.dart';
part 'action_event.dart';
part 'action_state.dart';

class ActionBloc extends Bloc<ActionEvent, ActionState> {
  final CarRepository _carRepository;
  ActionBloc(this._carRepository) : super(const _ActionState()) {
    on<_GetActions>(_onGetActions);
  }

  _onGetActions(_GetActions event, Emitter<ActionState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await Future.delayed(const Duration(seconds: 1));
    final result = await _carRepository.getCarActionsByCarId(event.carId);
    result.fold(
        (l) => emit(state.copyWith(
            message: l.toString(), status: FormzSubmissionStatus.failure)),
        (r) => emit(state.copyWith(
            carActionDayEntity: r, status: FormzSubmissionStatus.success)));
  }
}
