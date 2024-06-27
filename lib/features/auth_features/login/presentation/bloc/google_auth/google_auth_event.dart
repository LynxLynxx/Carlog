part of 'google_auth_bloc.dart';

@freezed
class GoogleAuthEvent with _$GoogleAuthEvent {
  const factory GoogleAuthEvent.firebaseLogin() = _FirebaseLogin;
}
