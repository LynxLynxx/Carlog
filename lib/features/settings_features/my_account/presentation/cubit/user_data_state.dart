part of 'user_data_cubit.dart';

@freezed
class UserDataState with _$UserDataState {
  const factory UserDataState.initial() = _Initial;
  const factory UserDataState.loading() = _Loading;
  const factory UserDataState.data(final UserDataEntity userData) = _Data;
  const factory UserDataState.failure(final Failure failure) = _Failure;
}
