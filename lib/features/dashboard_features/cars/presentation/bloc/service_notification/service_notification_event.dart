part of 'service_notification_bloc.dart';

@freezed
class ServiceNotificationEvent with _$ServiceNotificationEvent {
  const factory ServiceNotificationEvent.changeNotificationStatus(
          String carId, String actionId) =
      _ChangeNotificationStatus;
  const factory ServiceNotificationEvent.setInitialNotificationStatus(
          bool notificationStatus) =
      _SetInitialNotificationStatus;
}
