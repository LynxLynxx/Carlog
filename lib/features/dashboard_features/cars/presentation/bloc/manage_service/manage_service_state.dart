part of 'manage_service_bloc.dart';

@freezed
class ManageServiceState with _$ManageServiceState {
  const factory ManageServiceState([
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(CoordinatesEntityValidator.pure()) CoordinatesEntityValidator latitude,
    @Default(CoordinatesEntityValidator.pure()) CoordinatesEntityValidator longitude,
    @Default(CarActionEnum.service) CarActionEnum action,
    String? message,
  ]) = _ManageServiceState;
}
