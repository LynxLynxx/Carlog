import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/dashboard_features/home/data/datasources/action_datasource.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_day_entity.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class ActionRepository {
  Future<Either<Failure, List<CarActionDayEntity>>> getActions(String carId);
  Future<Option<Failure>> addAction(String carId, CarActionEntity carAction);
}

@LazySingleton(as: ActionRepository)
class ActionRepositoryImpl implements ActionRepository {
  final ActionDatasource _actionDatasource;

  ActionRepositoryImpl() : _actionDatasource = ActionDatasourceImpl();

  @override
  Future<Either<Failure, List<CarActionDayEntity>>> getActions(
      String carId) async {
    return handleResponse(() async {
      final carActionList = await _actionDatasource.getActions(carId);

      List<CarActionDayEntity> carActionDayList = [];
      bool todayExists = false;

      final DateTime startOfToday = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );

      final Map<DateTime, CarActionDayEntity> groupedActions = {};

      for (var carActionDay in carActionList) {
        DateTime timestamp = carActionDay.timestamp ?? DateTime.now();
        timestamp = DateTime(timestamp.year, timestamp.month, timestamp.day);

        if (timestamp.isBefore(startOfToday)) {
          continue;
        }

        if (timestamp == startOfToday) {
          todayExists = true;
        }

        if (!groupedActions.containsKey(timestamp)) {
          groupedActions[timestamp] = carActionDay;
        } else {
          groupedActions[timestamp] = groupedActions[timestamp]!.copyWith(
            carActions: [
              ...groupedActions[timestamp]!.carActions,
              ...carActionDay.carActions,
            ],
          );
        }
      }

      groupedActions.forEach((timestamp, carActionDay) {
        carActionDayList.add(carActionDay);
      });

      if (!todayExists) {
        final carActionDayEntity = CarActionDayEntity(
          timestamp: DateTime.now(),
          notificationActive: false,
          carActions: [],
          carId: carId,
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

  @override
  Future<Option<Failure>> addAction(
      String carId, CarActionEntity carAction) async {
    return handleVoidResponse(() async {
      final DateTime actionDate = carAction.timestamp!;
      final int second = actionDate.second;
      final int minute = actionDate.minute;
      final int hour = actionDate.hour;
      final int day = actionDate.day;
      final int month = actionDate.month;
      final int year = actionDate.year;

      final carActionList = await _actionDatasource.getActions(
        carId,
        conditionField: 'timestamp',
        isGreaterThanOrEqualToConditionValue:
            Timestamp.fromDate(DateTime(year, month, day)),
        isLessThanOrEqualToConditionValue: Timestamp.fromDate(
            DateTime(year, month, day, hour + 23, minute + 59, second + 59)),
      );
      if (carActionList.isNotEmpty) {
        CarActionDayEntity carActionDay = carActionList.first;
        List<CarActionEntity> carActions = carActionDay.carActions;
        List<dynamic> carActionsCopy =
            carActions.map((e) => e.toJson()).toList();
        carActionsCopy.add(carAction.toJson());

        await _actionDatasource.updateAction(
          carId,
          carActionDay.actionId,
          carActionsCopy,
        );
      } else {
        final carActionMap = {
          "timestamp": Timestamp.fromDate(actionDate),
          "notificationActive": false,
          "carActions": [carAction.toJson()],
          "carId": carId,
          "actionId": "",
        };
        await _actionDatasource.addAction(carId, carActionMap);
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
