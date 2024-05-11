part of 'reset_password_bloc.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(MailFormz.pure()) MailFormz mail,
    String? errorMessage,
  }) = _ResetPasswordState;
}
