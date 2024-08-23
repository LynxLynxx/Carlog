import 'package:carlog/core/constants/collections.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CarDatasource {
  Future<void> updateCar(CarFirebaseEntity carFirebase);
}

class CarDatasourceImpl implements CarDatasource {
  final FirebaseFirestore _firebaseFirestore;

  CarDatasourceImpl() : _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> updateCar(CarFirebaseEntity carFirebase) async =>
      await handleFirestoreDoc(
          _firebaseFirestore
              .collection(CollectionsK.cars)
              .doc(carFirebase.carId),
          (doc) => doc.update(carFirebase.toJson()));
}
