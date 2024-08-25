import 'package:bloc/bloc.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_day_entity.dart';
import 'package:carlog/features/dashboard_features/home/domain/usecases/get_actions_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_bloc.freezed.dart';
part 'action_event.dart';
part 'action_state.dart';

class ActionBloc extends Bloc<ActionEvent, ActionState> {
  final GetActionsUsecase _getActionsUsecase;
  ActionBloc(this._getActionsUsecase) : super(const _Initial()) {
    on<_GetActions>(_onGetActions);
  }

  _onGetActions(_GetActions event, Emitter<ActionState> emit) async {
    emit(const _Loading());
    await Future.delayed(const Duration(seconds: 1));
    final result = await _getActionsUsecase.call(event.carId);
    result.fold((l) => emit(_Failure(l)), (r) => emit(_Data(r)));
  }
}
