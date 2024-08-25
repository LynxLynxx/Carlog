part of 'user_app_bloc.dart';

@freezed
class UserAppState with _$UserAppState {
  const factory UserAppState.initial() = _Initial;
  const factory UserAppState.loading() = _Loading;
  const factory UserAppState.data(final CarFirebaseEntity? car) = _Data;
  const factory UserAppState.failure(final Failure failure) = _Failure;
}
