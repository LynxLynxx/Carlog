part of 'mail_login_bloc.dart';

@freezed
class MailLoginEvent with _$MailLoginEvent {
  const factory MailLoginEvent.emailChange(String value) = _EmailChange;
  const factory MailLoginEvent.passwordChange(String value) =
      _PasswordChange;
  const factory MailLoginEvent.submit() = _Submit;
}
