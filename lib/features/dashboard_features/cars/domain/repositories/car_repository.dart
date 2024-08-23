import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/dashboard_features/cars/datasource/car_datasource.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class CarRepository {
  Future<Option<Failure>> updateCar(CarFirebaseEntity carFirebase);
}

@LazySingleton(as: CarRepository)
class CarRepositoryImpl implements CarRepository {
  final CarDatasource _carDatasource;

  CarRepositoryImpl() : _carDatasource = CarDatasourceImpl();
  @override
  Future<Option<Failure>> updateCar(CarFirebaseEntity carFirebase) async {
    return await handleVoidResponse(
        () async => await _carDatasource.updateCar(carFirebase));
  }
}
