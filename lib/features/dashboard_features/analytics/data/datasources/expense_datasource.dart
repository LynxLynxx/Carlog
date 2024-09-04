import 'package:carlog/core/constants/collections.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ExpenseDatasource {
  Future<List<CarExpenseEntity>> getExpenses(String carId);
  Future<void> addExpense(String carId, Map<String, dynamic> carExpense);
  Future<void> updateExpense(
      String carId, String carExpenseId, Map<String, dynamic> carExpense);
  Future<void> deleteExpense(String carId, String carExpenseId);
}

class ExpenseDatasourceImpl implements ExpenseDatasource {
  final FirebaseFirestore _firebaseFirestore;

  ExpenseDatasourceImpl() : _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<CarExpenseEntity>> getExpenses(
    String carId,
  ) async =>
      await handleFirestoreCollectionData(
          _firebaseFirestore
              .collection(CollectionsK.cars)
              .doc(carId)
              .collection(CollectionsK.expenses)
              .path, (doc) {
        return doc
            .map((model) =>
                CarExpenseEntity.fromJson(model.data() as Map<String, dynamic>))
            .toList();
      });

  @override
  Future<void> addExpense(
          String carId, Map<String, dynamic> carExpense) async =>
      await handleFirestoreCollection(
          _firebaseFirestore
              .collection(CollectionsK.cars)
              .doc(carId)
              .collection(CollectionsK.expenses), (collection) async {
        await collection.doc(carExpense["carExpenseId"]).set(carExpense);
      });

  @override
  Future<void> updateExpense(String carId, String carExpenseId,
          Map<String, dynamic> carExpense) async =>
      await handleFirestoreDoc(
          _firebaseFirestore
              .collection(CollectionsK.cars)
              .doc(carId)
              .collection(CollectionsK.expenses)
              .doc(carExpenseId), (doc) {
        doc.update(carExpense);
      });

  @override
  Future<void> deleteExpense(String carId, String carExpenseId) async =>
      await handleFirestoreDoc(
          _firebaseFirestore
              .collection(CollectionsK.cars)
              .doc(carId)
              .collection(CollectionsK.expenses)
              .doc(carExpenseId),
          (doc) => doc.delete());
}
