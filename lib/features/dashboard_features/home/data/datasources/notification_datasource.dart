import 'package:carlog/core/constants/collections.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class NotificationDatasource {
  Future<void> updateNotificationStatus(
      String carId, String actionId, bool notification);
}

class NotificationDatasourceImpl implements NotificationDatasource {
  final FirebaseFirestore _firebaseFirestore;

  NotificationDatasourceImpl()
      : _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> updateNotificationStatus(
          String carId, String actionId, bool notification) async =>
      await handleFirestoreDoc(
          _firebaseFirestore
              .collection(CollectionsK.cars)
              .doc(carId)
              .collection(CollectionsK.actions)
              .doc(actionId),
          (doc) => doc.update({
                "notificationActive": notification,
              }));
}
