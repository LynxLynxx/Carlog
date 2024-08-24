import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CarRepository {
  const CarRepository();

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
                carActionEntity.timestamp!.month ||
            DateTime.fromMillisecondsSinceEpoch(
                        timestamp.millisecondsSinceEpoch)
                    .year !=
                carActionEntity.timestamp!.year) {
          carActions.removeAt(indexToUpdate);
          await carActionsDocRef.update({'carActions': carActions});
          // await addCarActionsByCarId(carId, carActionEntity);
          if (carActions.isEmpty) {
            await carActionsDocRef.delete();
          }
          return;
        }
        carActions[indexToUpdate]['latitude'] = carActionEntity.latitude;
        carActions[indexToUpdate]['longitude'] = carActionEntity.longitude;
        carActions[indexToUpdate]['address'] = carActionEntity.address;
        carActions[indexToUpdate]['action'] = carActionEntity.action!.name;
        carActions[indexToUpdate]['note'] = carActionEntity.note;
        await carActionsDocRef.update({'carActions': carActions});
      }
    });
  }
}
