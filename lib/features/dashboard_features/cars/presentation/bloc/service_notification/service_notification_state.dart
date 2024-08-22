part of 'service_notification_bloc.dart';

@freezed
class ServiceNotificationState with _$ServiceNotificationState {
  const factory ServiceNotificationState([
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool notificationStatus,
    String? message,
  ]) = _ServiceNotificationState;
}
