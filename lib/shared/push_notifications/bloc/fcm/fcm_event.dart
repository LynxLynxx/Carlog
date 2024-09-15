part of 'fcm_bloc.dart';

@freezed
class FcmEvent with _$FcmEvent {
  const factory FcmEvent.started() = _Started;
  const factory FcmEvent.notification(
      final PushNotificationEntity pushNotification) = _Notification;
}
