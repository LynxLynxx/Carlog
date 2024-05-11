part of 'google_auth_bloc.dart';

@freezed
class GoogleAuthState with _$GoogleAuthState {
  const factory GoogleAuthState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    String? errorMessage,
  }) = _GoogleAuthState;
}
