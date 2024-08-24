import 'package:carlog/core/constants/collections.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_day_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ActionDatasource {
  Future<List<CarActionDayEntity>> getActions(String carId,
      {String? conditionField,
      dynamic isEqualToConditionValue,
      dynamic isGreaterThanOrEqualToConditionValue,
      dynamic isLessThanOrEqualToConditionValue});

  Future<void> addAction(String carId, Map<String, dynamic> carActionDay);
  Future<void> updateAction(
      String carId, String actionId, List<dynamic> carActions);
  Future<void> deleteAction(String carId, String actionId);
}

class ActionDatasourceImpl implements ActionDatasource {
  final FirebaseFirestore _firebaseFirestore;

  ActionDatasourceImpl() : _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<CarActionDayEntity>> getActions(String carId,
          {String? conditionField,
          dynamic isEqualToConditionValue,
          dynamic isGreaterThanOrEqualToConditionValue,
          dynamic isLessThanOrEqualToConditionValue}) async =>
      await handleFirestoreCollectionData(
          _firebaseFirestore
              .collection(CollectionsK.cars)
              .doc(carId)
              .collection(CollectionsK.actions)
              .path,
          conditionField: conditionField,
          isEqualToConditionValue: isEqualToConditionValue,
          isGreaterThanOrEqualToConditionValue:
              isGreaterThanOrEqualToConditionValue,
          isLessThanOrEqualToConditionValue: isLessThanOrEqualToConditionValue,
          (doc) {
        return doc
            .map((model) => CarActionDayEntity.fromJson(
                model.data() as Map<String, dynamic>))
            .toList();
      });

  @override
  Future<void> addAction(
          String carId, Map<String, dynamic> carActionDay) async =>
      await handleFirestoreCollection(
          _firebaseFirestore
              .collection(CollectionsK.cars)
              .doc(carId)
              .collection(CollectionsK.actions), (collection) async {
        await collection
            .add(carActionDay)
            .then((doc) => collection.doc(doc.id).update({
                  "actionId": doc.id,
                }));
      });

  @override
  Future<void> updateAction(
          String carId, String actionId, List<dynamic> carActions) async =>
      await handleFirestoreDoc(
          _firebaseFirestore
              .collection(CollectionsK.cars)
              .doc(carId)
              .collection(CollectionsK.actions)
              .doc(actionId),
          (doc) => doc.update({
                "carActions": carActions,
              }));

  @override
  Future<void> deleteAction(String carId, String actionId) async =>
      await handleFirestoreDoc(
          _firebaseFirestore
              .collection(CollectionsK.cars)
              .doc(carId)
              .collection(CollectionsK.actions)
              .doc(actionId),
          (doc) => doc.delete());
}
