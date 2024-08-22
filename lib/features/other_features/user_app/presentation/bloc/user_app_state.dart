part of 'user_app_bloc.dart';

@freezed
class UserAppState with _$UserAppState {
  const factory UserAppState({
    CarFirebaseEntity? car,
}) = _UserAppState;
}
