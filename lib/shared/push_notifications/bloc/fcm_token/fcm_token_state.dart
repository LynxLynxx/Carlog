part of 'fcm_token_bloc.dart';

@freezed
class FcmTokenState with _$FcmTokenState {
  const factory FcmTokenState.initial() = _Initial;
  const factory FcmTokenState.loading() = _Loading;
  const factory FcmTokenState.success() = _Success;
  const factory FcmTokenState.failure(final Failure failure) = _Failure;
}
