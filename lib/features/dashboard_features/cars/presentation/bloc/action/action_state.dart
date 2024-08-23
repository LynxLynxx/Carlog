part of 'action_bloc.dart';

@freezed
class ActionState with _$ActionState {
  const factory ActionState.initial() = _Initial;
  const factory ActionState.loading() = _Loading;
  const factory ActionState.data(List<CarActionDayEntity> carActionDayEntity) =
      _Data;
  const factory ActionState.failure(Failure failure) = _Failure;
}
