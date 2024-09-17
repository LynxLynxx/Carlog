part of 'mail_register_bloc.dart';

@freezed
class MailRegisterEvent with _$MailRegisterEvent {
  const factory MailRegisterEvent.nameChange(String value) =
      _NameChange;
  const factory MailRegisterEvent.emailChange(String value) = _EmailChange;
  const factory MailRegisterEvent.passwordChange(String value) =
      _PasswordChange;
  const factory MailRegisterEvent.submit() = _Submit;
}
