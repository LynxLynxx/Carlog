import 'package:carlog/core/error/failures.dart';
import 'package:carlog/shared/push_notifications/domain/repository/fcm_token_repository.dart';
import 'package:carlog/shared/push_notifications/entities/fcm_token_entity.dart';
import 'package:dartz/dartz.dart';

class FcmTokenUsecase {
  final FcmTokenRepository _fcmTokenRepository;

  FcmTokenUsecase(this._fcmTokenRepository);
  Future<Option<Failure>> call(
          FcmTokenEntity fcmTokenEntity, String documentId) =>
      _fcmTokenRepository.saveFcmToken(fcmTokenEntity, documentId);
}
