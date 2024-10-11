import 'package:carlog/core/constants/collections.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class MilageDatasource {
  Future<void> updateMilage(String carId, int milage);
}

class MilageDatasourceImpl implements MilageDatasource {
  final FirebaseFirestore _firebaseFirestore;

  MilageDatasourceImpl() : _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> updateMilage(String carId, int milage) async =>
      await handleFirestoreDoc(
          _firebaseFirestore.collection(CollectionsK.cars).doc(carId),
          (doc) => doc.update({
                "milage": milage,
              }));
}
