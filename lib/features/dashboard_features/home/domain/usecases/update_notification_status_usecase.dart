import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/home/domain/repository/notification_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UpdateNotificationStatusUsecase {
  final NotificationRepository _notificationRepository;

  UpdateNotificationStatusUsecase(this._notificationRepository);

  Future<Option<Failure>> call(
          String carId, String actionId, bool notification) async =>
      await _notificationRepository.updateNotificationStatus(
          carId, actionId, notification);
}
