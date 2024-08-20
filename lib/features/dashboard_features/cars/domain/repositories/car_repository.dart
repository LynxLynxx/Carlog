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
      bool todayExists = false;
      await carActionsRef.get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            final data = docSnapshot.data() as Map<String, dynamic>;

            DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(
                (data['timestamp'] as Timestamp).millisecondsSinceEpoch);

            timestamp = DateTime(
              timestamp.year,
              timestamp.month,
              timestamp.day,
            );

            final DateTime startOfToday = DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
            );

            if (timestamp.isBefore(startOfToday)) {
              continue;
            }

            if (timestamp == startOfToday) {
              todayExists = true;
            }

            final List<CarActionEntity> carActions =
                (data['carActions'] as List)
                    .map((action) {
                      final model = CarActionEntity.fromJson(action);
                      return model;
                    })
                    .cast<CarActionEntity>()
                    .toList();

            final carActionDayEntity = CarActionDayEntity(
              timestamp: timestamp,
              notificationActive: data['notificationActive'],
              carActions: carActions,
              carId: data['carId'],
              actionId: data['actionId'],
            );

            carActionDayList.add(carActionDayEntity);
          }
        },
      );

      if (!todayExists) {
        final carActionDayEntity = CarActionDayEntity(
          timestamp: DateTime.now(),
          notificationActive: false,
          carActions: [],
          carId: '',
          actionId: '',
        );

        carActionDayList.add(carActionDayEntity);
      }

      carActionDayList.sort((a, b) {
        return a.timestamp!.compareTo(b.timestamp!);
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

      int day = carAction.timestamp?.day ?? 0;
      int month = carAction.timestamp?.month ?? 0;
      int year = carAction.timestamp?.year ?? 0;

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
          "timestamp": Timestamp.fromDate(carAction.timestamp!),
          "notificationActive": false,
          "carActions": [carAction.toJson()],
          "carId": carId,
          "actionId": "",
        };

        final addAction = await carActionsRef.add(data);

        await carActionsRef
            .doc(addAction.id)
            .update({"actionId": addAction.id});
      }
    });
  }

  Future<Option<Failure>> changeNotificationOfDayByCarId(
      String carId, String actionId, bool notification) async {
    return handleVoidResponse(() async {
      final DocumentReference carRef = FirebaseFirestore.instance
          .collection('cars')
          .doc(carId)
          .collection('actions')
          .doc(actionId);

      await carRef.update({
        "notificationActive": notification,
      });
    });
  }
}
