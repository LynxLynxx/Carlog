part of 'mail_login_bloc.dart';

@freezed
class MailLoginState with _$MailLoginState {
  const factory MailLoginState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(MailFormz.pure()) MailFormz mail,
    @Default(PasswordMailEntity.pure()) PasswordMailEntity password,
    String? errorMessage,
  }) = _MailLoginState;
}
