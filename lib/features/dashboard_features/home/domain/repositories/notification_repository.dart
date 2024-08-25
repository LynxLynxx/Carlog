import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/dashboard_features/home/data/datasources/notification_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class NotificationRepository {
  Future<Option<Failure>> updateNotificationStatus(
      String carId, String actionId, bool notification);
}

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDatasource _notificationDatasource;

  NotificationRepositoryImpl()
      : _notificationDatasource = NotificationDatasourceImpl();
  @override
  Future<Option<Failure>> updateNotificationStatus(
      String carId, String actionId, bool notification) async {
    return await handleVoidResponse(() async => await _notificationDatasource
        .updateNotificationStatus(carId, actionId, notification));
  }
}
