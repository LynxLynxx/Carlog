part of 'action_bloc.dart';

@freezed
class ActionState with _$ActionState {
  const factory ActionState([
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default([]) List<CarActionDayEntity> carActionDayEntity,
    String? message,
  ]) = _ActionState;
}
