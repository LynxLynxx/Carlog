part of 'fcm_bloc.dart';

@freezed
class FcmState with _$FcmState {
  const factory FcmState.initial() = _Initial;
  const factory FcmState.showNotification(
      final PushNotificationEntity pushNotification) = _ShowNotification;
}
