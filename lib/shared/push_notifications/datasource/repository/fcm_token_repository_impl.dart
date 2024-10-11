import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/shared/push_notifications/datasource/datasource/fcm_token_datasource.dart';
import 'package:carlog/shared/push_notifications/domain/repository/fcm_token_repository.dart';
import 'package:carlog/shared/push_notifications/entities/fcm_token_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: FcmTokenRepository)
class FcmTokenRepositoryImpl implements FcmTokenRepository {
  final FcmTokenDatasource _fcmTokenDatasource;

  FcmTokenRepositoryImpl() : _fcmTokenDatasource = FcmTokenDatasourceImpl();
  @override
  Future<Option<Failure>> saveFcmToken(
      FcmTokenEntity fcmTokenEntity, String documentId) async {
    return await handleVoidResponse(() async =>
        _fcmTokenDatasource.saveFcmToken(fcmTokenEntity, documentId));
  }
}
