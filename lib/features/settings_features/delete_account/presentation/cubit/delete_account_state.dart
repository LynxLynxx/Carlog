part of 'delete_account_cubit.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState.initial() = _Initial;
  const factory DeleteAccountState.loading() = _Loading;
  const factory DeleteAccountState.data() = _Data;
  const factory DeleteAccountState.failure(final Failure failure) = _Failure;
}
