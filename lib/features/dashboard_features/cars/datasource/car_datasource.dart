import 'package:carlog/core/constants/collections.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class CarDatasource {
  Future<void> addCar(CarFirebaseEntity carFirebase,
      {String customCollection = CollectionsK.cars});
  Future<void> updateCar(CarFirebaseEntity carFirebase);
  Future<CarFirebaseEntity> getCar(String carId);
  Future<void> deleteCar(String carId);
  Future<List<CarFirebaseEntity>> getCars();
}

class CarDatasourceImpl implements CarDatasource {
  final FirebaseFirestore _firebaseFirestore;

  CarDatasourceImpl() : _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> addCar(CarFirebaseEntity carFirebase,
          {String customCollection = CollectionsK.cars}) async =>
      await handleFirestoreCollection(
          _firebaseFirestore.collection(customCollection), (collection) async {
        await collection
            .add(carFirebase.toJson())
            .then((doc) => collection.doc(doc.id).update({
                  'carId': doc.id,
                  'userId': FirebaseAuth.instance.currentUser?.uid,
                }));
      });

  @override
  Future<void> updateCar(CarFirebaseEntity carFirebase) async =>
      await handleFirestoreDoc(
          _firebaseFirestore
              .collection(CollectionsK.cars)
              .doc(carFirebase.carId),
          (doc) => doc.update(carFirebase.toJson()));

  @override
  Future<CarFirebaseEntity> getCar(String carId) async =>
      await handleFirestoreDocData(
          _firebaseFirestore.collection(CollectionsK.cars).doc(carId).path,
          (doc) => CarFirebaseEntity.fromJson(doc));

  @override
  Future<void> deleteCar(String carId) async => await handleFirestoreDoc(
      _firebaseFirestore.collection(CollectionsK.cars).doc(carId),
      (doc) => doc.delete());

  @override
  Future<List<CarFirebaseEntity>> getCars() async =>
      await handleFirestoreCollectionData(
          _firebaseFirestore.collection(CollectionsK.cars).path,
          conditionField: 'userId',
          conditionValue: FirebaseAuth.instance.currentUser?.uid, (doc) {
        return doc
            .map((model) => CarFirebaseEntity.fromJson(
                model.data() as Map<String, dynamic>))
            .toList();
      });
}
