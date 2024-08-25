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
  Future<Option<Failure>> updateAction(
      String carId, String actionId, CarActionEntity carActionEntity);
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
      bool iterated = false;

      final DateTime startOfToday = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );

      final Map<DateTime, CarActionDayEntity> groupedActions = {};

      for (var carActionDay in carActionList) {
        iterated = true;
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

      if (!todayExists && iterated) {
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

  @override
  Future<Option<Failure>> updateAction(
      String carId, String actionId, CarActionEntity carActionEntity) async {
    return handleVoidResponse(() async {
      List<CarActionDayEntity> list = await _actionDatasource.getActions(carId);

      CarActionDayEntity model =
          list.firstWhere((element) => element.actionId == actionId);

      List<CarActionEntity> carActionsCopy = List.from(model.carActions);

      int index = model.carActions.indexWhere((element) {
        return element.carActionId == carActionEntity.carActionId;
      });
      if (index != -1) {
        DateTime actionDate = model.carActions[index].timestamp!;
        if (actionDate.day != carActionEntity.timestamp!.day ||
            actionDate.month != carActionEntity.timestamp!.month ||
            actionDate.year != carActionEntity.timestamp!.year) {
          carActionsCopy.removeAt(index);
          if (carActionsCopy.isEmpty) {
            await _actionDatasource.deleteAction(carId, actionId);
          } else {
            await _actionDatasource.updateAction(
              carId,
              actionId,
              carActionsCopy.map((e) => e.toJson()).toList(),
            );
          }

          addAction(carId, carActionEntity);

          return;
        }

        carActionsCopy[index] = carActionsCopy[index].copyWith(
          latitude: carActionEntity.latitude,
          longitude: carActionEntity.longitude,
          address: carActionEntity.address,
          action: carActionEntity.action,
          note: carActionEntity.note,
        );

        await _actionDatasource.updateAction(
          carId,
          actionId,
          carActionsCopy.map((e) => e.toJson()).toList(),
        );
      }
    });
  }
}
