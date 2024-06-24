part of 'reset_password_bloc.dart';

@freezed
class ResetPasswordEvent with _$ResetPasswordEvent {
  const factory ResetPasswordEvent.emailChange(String value) = _EmailChange;
  const factory ResetPasswordEvent.submit() = _Submit;
}
