part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.appLogoutRequested() = _AppLogoutRequested;
  const factory AuthEvent.appUserChanged(UserEntity user) = _AppUserChanged;
  const factory AuthEvent.getUserSession() = _GetUserSession;
}
