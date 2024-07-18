part of 'microsoft_auth_bloc.dart';

@freezed
class MicrosoftAuthEvent with _$MicrosoftAuthEvent {
  const factory MicrosoftAuthEvent.firebaseLogin() = _FirebaseLogin;
}
