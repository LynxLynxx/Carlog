part of 'firebase_auth_bloc.dart';

@freezed
class FirebaseAuthState with _$FirebaseAuthState {
  const factory FirebaseAuthState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    String? errorMessage,
  }) = _FirebaseAuthState;
}
