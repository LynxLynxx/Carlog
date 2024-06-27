import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/refuel_firebase_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RefuelRepository {
  const RefuelRepository();

  Future<Option<Failure>> createNewRefuelByUser(String carId, String liters,
      String milage, String price, String pricePerLiter) async {
    return handleVoidResponse(() async {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return;
      }

      final refuelCol = FirebaseFirestore.instance.collection('refuel');

      final addRefuel = await refuelCol.add({
        "userId": user.uid,
        "carId": carId,
        "liters": liters.isNotEmpty ? int.parse(liters) : 0,
        "milage": milage.isNotEmpty ? int.parse(milage) : 0,
        "price": liters.isNotEmpty ? double.parse(liters) : 0,
        "pricePerLiter": liters.isNotEmpty ? double.parse(liters) : 0,
        "refuelId": ""
      });

      await refuelCol.doc(addRefuel.id).update({"refuelId": addRefuel.id});
    });
  }

  Future<Option<Failure>> updateRefuelByUser(String refuelId, String liters,
      String milage, String price, String pricePerLiter) async {
    return handleVoidResponse(() async {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return;
      }

      final refuelCol = FirebaseFirestore.instance.collection('refuel');

      await refuelCol.doc(refuelId).update({
        "liters": liters.isNotEmpty ? int.parse(liters) : 0,
        "milage": milage.isNotEmpty ? int.parse(milage) : 0,
        "price": liters.isNotEmpty ? double.parse(liters) : 0,
        "pricePerLiter": liters.isNotEmpty ? double.parse(liters) : 0,
      });
    });
  }

  Future<Option<Failure>> deleteRefuelByUser(String refuelId) async {
    return handleVoidResponse(() async {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return;
      }

      final CollectionReference refuelRef =
          FirebaseFirestore.instance.collection('refuel');
      final CollectionReference refuelDeletedRef =
          FirebaseFirestore.instance.collection('refuelDeleted');

      final refuel =
          await refuelRef.where('refuelId', isEqualTo: refuelId).get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            return RefuelFirebaseEntity.fromJson(
                docSnapshot.data() as Map<String, dynamic>);
          }
        },
      );

      await refuelDeletedRef.doc(refuel?.refuelId).set({
        "userId": user.uid,
        "carId": refuel?.carId,
        "liters":
            (refuel?.liters ?? "").toString().isNotEmpty ? refuel?.liters : 0,
        "milage":
            (refuel?.milage ?? "").toString().isNotEmpty ? refuel?.milage : 0,
        "price":
            (refuel?.price ?? "").toString().isNotEmpty ? refuel?.price : 0,
        "pricePerLiter": (refuel?.pricePerLiter ?? "").toString().isNotEmpty
            ? refuel?.pricePerLiter
            : 0,
        "refuelId": refuel?.refuelId,
      });

      await refuelRef.doc(refuel?.refuelId).delete();
    });
  }

  Future<Either<Failure, List<RefuelFirebaseEntity>>> getListOfRefuelsByUser(
      String carId) async {
    return handleResponse(() async {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return [];
      }

      final CollectionReference refuelRef =
          FirebaseFirestore.instance.collection('refuel');

      List<RefuelFirebaseEntity> refuelList = [];
      await refuelRef
          .where('userId', isEqualTo: user.uid)
          .where('carId', isEqualTo: carId)
          .get()
          .then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            final model = RefuelFirebaseEntity.fromJson(
                docSnapshot.data() as Map<String, dynamic>);
            refuelList.add(model);
          }
        },
      );
      return refuelList;
    });
  }
}
