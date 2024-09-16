import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_notification_entity.freezed.dart';
part 'push_notification_entity.g.dart';

@freezed
class PushNotificationEntity with _$PushNotificationEntity {
  factory PushNotificationEntity({
    required final String title,
    required final String description,
    final String? url,
  }) = _PushNotificationEntity;

  factory PushNotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationEntityFromJson(json);
}
