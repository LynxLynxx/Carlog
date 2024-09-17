part of 'mail_register_bloc.dart';

@freezed
class MailRegisterState with _$MailRegisterState {
  const factory MailRegisterState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(NameFormz.pure()) NameFormz name,
    @Default(MailFormz.pure()) MailFormz mail,
    @Default(PasswordMailEntity.pure()) PasswordMailEntity password,
    String? errorMessage,
  }) = _MailRegisterState;
}
