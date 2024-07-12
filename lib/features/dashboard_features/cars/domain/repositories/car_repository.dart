import 'dart:developer';

import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_day_entity.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_entity.dart';
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

  Future<Either<Failure, List<CarActionDayEntity>>> getCarActionsByCarId(
      String carId) async {
    return handleResponse(() async {
      final CollectionReference carActionsRef = FirebaseFirestore.instance
          .collection('cars')
          .doc(carId)
          .collection('actions');

      List<CarActionDayEntity> carActionDayList = [];
      await carActionsRef.get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            final data = docSnapshot.data() as Map<String, dynamic>;
            final List<CarActionEntity> carActions =
                (data['carActions'] as List)
                    .map((action) {
                      final model = CarActionEntity.fromJson(action);
                      if (!DateTime.fromMillisecondsSinceEpoch(model.timestamp!)
                          .isBefore(DateTime.now())) {
                        return model;
                      }
                      return null;
                    })
                    .where((action) => action != null)
                    .cast<CarActionEntity>()
                    .toList();

            final carActionDayEntity = CarActionDayEntity(
              timestamp: data['timestamp'],
              notificationActive: data['notificationActive'],
              carActions: carActions,
            );

            carActionDayList.add(carActionDayEntity);
          }
        },
      );
      carActionDayList.sort((a, b) {
        final dateA = DateTime.fromMillisecondsSinceEpoch(a.timestamp!);
        final dateB = DateTime.fromMillisecondsSinceEpoch(b.timestamp!);
        return dateA.compareTo(dateB);
      });
      return carActionDayList;
    });
  }

  Future<Option<Failure>> addCarActionsByCarId(
      String carId, CarActionEntity carAction) async {
    return handleVoidResponse(() async {
      final CollectionReference carActionsRef = FirebaseFirestore.instance
          .collection('cars')
          .doc(carId)
          .collection('actions');

      DateTime actionDate =
          DateTime.fromMillisecondsSinceEpoch(carAction.timestamp!);
      int day = actionDate.day;
      int month = actionDate.month;
      int year = actionDate.year;

      QuerySnapshot querySnapshot = await carActionsRef.get();
      DocumentSnapshot? existingDocument;

      for (var doc in querySnapshot.docs) {
        DateTime docDate = DateTime.fromMillisecondsSinceEpoch(
            (doc.data() as Map<String, dynamic>)['timestamp']);
        if (docDate.year == year &&
            docDate.month == month &&
            docDate.day == day) {
          existingDocument = doc;
          break;
        }
      }

      if (existingDocument != null) {
        DocumentSnapshot document = querySnapshot.docs.first;
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        List<dynamic> carActions = data['carActions'] ?? [];
        carActions.add(carAction.toJson());

        await carActionsRef.doc(document.id).update({'carActions': carActions});
      } else {
        final data = {
          "timestamp": carAction.timestamp,
          "debugDate": "$day-$month-$year",
          "notificationActive": false,
          "carActions": [carAction.toJson()],
        };

        await carActionsRef.add(data);
      }
    });
  }

  // Future<Option<Failure>> changeNotificationOfDayByCarId(
  //     String carId, String dayId, bool notification) async {
  //   return handleVoidResponse(() async {
  //     final CollectionReference carRef =
  //         FirebaseFirestore.instance.collection('cars');

  //     await carRef.doc(carId).update({
  //       "notification": notification,
  //     });
  //   });
  // }
}
