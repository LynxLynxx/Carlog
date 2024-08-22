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
      bool iterated = false;
      await carActionsRef.get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            iterated = true;
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

      if (!todayExists && iterated) {
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

      final DateTime actionDate = carAction.timestamp!;
      final int day = actionDate.day;
      final int month = actionDate.month;
      final int year = actionDate.year;

      QuerySnapshot querySnapshot = await carActionsRef
          .where('timestamp',
              isGreaterThanOrEqualTo:
                  Timestamp.fromDate(DateTime(year, month, day)),
              isLessThanOrEqualTo:
                  Timestamp.fromDate(DateTime(year, month, day + 1)))
          .limit(1)
          .get();

      DocumentSnapshot? existingDocument =
          querySnapshot.docs.isNotEmpty ? querySnapshot.docs.first : null;

      if (existingDocument != null) {
        Map<String, dynamic> data =
            existingDocument.data() as Map<String, dynamic>;
        List<dynamic> carActions = data['carActions'] ?? [];
        carActions.add(carAction.toJson());

        await carActionsRef
            .doc(existingDocument.id)
            .update({'carActions': carActions});
      } else {
        final newData = {
          "timestamp": Timestamp.fromDate(actionDate),
          "notificationActive": false,
          "carActions": [carAction.toJson()],
          "carId": carId,
          "actionId": "",
        };

        final addAction = await carActionsRef.add(newData);
        await carActionsRef
            .doc(addAction.id)
            .update({"actionId": addAction.id});
      }
    });
  }

  Future<Option<Failure>> updateCarActionsByCarActionId(
      String carId, String actionId, CarActionEntity carActionEntity) async {
    return handleVoidResponse(() async {
      final DocumentReference carActionsDocRef = FirebaseFirestore.instance
          .collection('cars')
          .doc(carId)
          .collection('actions')
          .doc(actionId);

      DocumentSnapshot documentSnapshot = await carActionsDocRef.get();

      if (!documentSnapshot.exists) {
        return;
      }

      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      List<dynamic> carActions = data['carActions'] ?? [];

      int indexToUpdate = carActions.indexWhere((action) {
        return action['carActionId'] == carActionEntity.carActionId;
      });
      if (indexToUpdate != -1) {
        Timestamp timestamp = data['timestamp'];
        if (DateTime.fromMillisecondsSinceEpoch(
                        timestamp.millisecondsSinceEpoch)
                    .day !=
                carActionEntity.timestamp!.day ||
            DateTime.fromMillisecondsSinceEpoch(
                        timestamp.millisecondsSinceEpoch)
                    .month !=
                carActionEntity.timestamp!.day ||
            DateTime.fromMillisecondsSinceEpoch(
                        timestamp.millisecondsSinceEpoch)
                    .year !=
                carActionEntity.timestamp!.day) {
          carActions.removeAt(indexToUpdate);
          await carActionsDocRef.update({'carActions': carActions});
          await addCarActionsByCarId(carId, carActionEntity);
          if (carActions.isEmpty) {
            await carActionsDocRef.delete();
          }
          return;
        }

        carActions[indexToUpdate]['latitude'] = carActionEntity.latitude;
        carActions[indexToUpdate]['longitude'] = carActionEntity.longitude;
        carActions[indexToUpdate]['address'] = carActionEntity.address;
        carActions[indexToUpdate]['action'] = carActionEntity.action!.name;
        await carActionsDocRef.update({'carActions': carActions});
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

  Future<Option<Failure>> updateMilageByCarId(
      String carId, String milage) async {
    return handleVoidResponse(() async {
      final DocumentReference carRef =
          FirebaseFirestore.instance.collection('cars').doc(carId);

      await carRef.update({
        "milage": milage,
      });
    });
  }
}
