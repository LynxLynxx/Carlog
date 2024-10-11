import 'package:carlog/core/constants/collections.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/shared/push_notifications/entities/fcm_token_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FcmTokenDatasource {
  Future<void> saveFcmToken(FcmTokenEntity fcmTokenEntity, String documentId);
}

class FcmTokenDatasourceImpl implements FcmTokenDatasource {
  final FirebaseFirestore _firebase;

  FcmTokenDatasourceImpl() : _firebase = FirebaseFirestore.instance;
  @override
  Future<void> saveFcmToken(
      FcmTokenEntity fcmTokenEntity, String documentId) async {
    await handleFirestoreCollection(_firebase.collection(CollectionsK.fcmToken),
        (collection) {
      final doc = collection.doc(documentId);
      if (fcmTokenEntity.iosToken.isNotEmpty) {
        doc.set({
          "iosToken": fcmTokenEntity.iosToken,
        });
      }
      if (fcmTokenEntity.androidToken.isNotEmpty) {
        doc.set({
          "androidToken": fcmTokenEntity.androidToken,
        });
      }
    });
    return;
  }
}
