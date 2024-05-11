part of 'firebase_auth_bloc.dart';

@freezed
class FirebaseAuthEvent with _$FirebaseAuthEvent {
  const factory FirebaseAuthEvent.googleSignIn() = _GoogleSignIn;
  const factory FirebaseAuthEvent.facebookSignIn() = _FacebookSignIn;
}
