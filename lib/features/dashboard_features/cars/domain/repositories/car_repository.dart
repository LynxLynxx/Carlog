import 'dart:developer';

import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CarRepository {
  const CarRepository();

  Future<Option<Failure>> createCarByUser(CarFirebaseEntity carFirebase) async {
    return handleVoidResponse(() async {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return;
      }

      final CollectionReference carRef =
          FirebaseFirestore.instance.collection('cars');

      final addCar = await carRef.add({
        "userId": user.uid,
        "carId": "",
        "brand": carFirebase.brand ?? S.current.carBrand,
        "model": carFirebase.model ?? S.current.carModel,
        "year": carFirebase.year,
        "milage": carFirebase.milage,
        "plate": carFirebase.plate,
        "carType": carFirebase.carType,
        "fuelType": carFirebase.fuelType,
        "engineCapacity": carFirebase.engineCapacity,
        "enginePower": carFirebase.enginePower,
      });

      await carRef.doc(addCar.id).update({"carId": addCar.id});
    });
  }

  Future<Option<Failure>> updateCarByUser(CarFirebaseEntity carFirebase) async {
    return handleVoidResponse(() async {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return;
      }

      final CollectionReference carRef =
          FirebaseFirestore.instance.collection('cars');

      await carRef.doc(carFirebase.carId).update({
        "brand": carFirebase.brand ?? S.current.carBrand,
        "model": carFirebase.model ?? S.current.carModel,
        "year": carFirebase.year,
        "milage": carFirebase.milage,
        "plate": carFirebase.plate,
        "carType": carFirebase.carType,
        "fuelType": carFirebase.fuelType,
        "engineCapacity": carFirebase.engineCapacity,
        "enginePower": carFirebase.enginePower,
      });
    });
  }

  Future<Option<Failure>> deleteCarByUser(String carId) async {
    return handleVoidResponse(() async {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return;
      }

      final CollectionReference carRef =
          FirebaseFirestore.instance.collection('cars');
      final CollectionReference deletedCarRef =
          FirebaseFirestore.instance.collection('carsDeleted');

      final car = await carRef.where('carId', isEqualTo: carId).get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            return CarFirebaseEntity.fromJson(
                docSnapshot.data() as Map<String, dynamic>);
          }
        },
      );

      await deletedCarRef.doc(car?.carId).set({
        "userId": user.uid,
        "brand": car?.brand ?? "",
        "model": car?.model ?? "",
        "year": (car?.year ?? "").toString().isNotEmpty ? car?.year : 0,
        "plate": car?.plate ?? "",
        "carId": car?.carId,
      });

      await carRef.doc(car!.carId).delete();
    });
  }

  Future<Either<Failure, List<CarFirebaseEntity>>> getListOfCarsByUser() async {
    return handleResponse(() async {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return [];
      }

      final CollectionReference carRef =
          FirebaseFirestore.instance.collection('cars');

      List<CarFirebaseEntity> carList = [];
      await carRef.where('userId', isEqualTo: user.uid).get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            final model = CarFirebaseEntity.fromJson(
                docSnapshot.data() as Map<String, dynamic>);
            log(model.toString());
            carList.add(model);
          }
        },
      );
      return carList;
    });
  }
}
