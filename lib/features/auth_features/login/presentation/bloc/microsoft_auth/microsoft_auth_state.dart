part of 'microsoft_auth_bloc.dart';

@freezed
class MicrosoftAuthState with _$MicrosoftAuthState {
  const factory MicrosoftAuthState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    String? errorMessage,
  }) = _MicrosoftAuthState;
}
