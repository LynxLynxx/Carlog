part of 'service_bloc.dart';

@freezed
class ServiceState with _$ServiceState {
  const factory ServiceState([
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default([]) List<CarActionDayEntity> carActionDayEntity,
    String? message,
  ]) = _ServiceState;
}
