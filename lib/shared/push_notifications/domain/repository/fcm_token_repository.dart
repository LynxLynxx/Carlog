import 'package:carlog/core/error/failures.dart';
import 'package:carlog/shared/push_notifications/entities/fcm_token_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FcmTokenRepository {
  Future<Option<Failure>> saveFcmToken(
      FcmTokenEntity fcmTokenEntity, String documentId);
}
