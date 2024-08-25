import 'package:carlog/core/constants/collections.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/dashboard_features/cars/data/datasources/car_datasource.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class CarRepository {
  Future<Option<Failure>> addCar(CarFirebaseEntity carFirebase);
  Future<Option<Failure>> updateCar(CarFirebaseEntity carFirebase);
  Future<Option<Failure>> deleteCar(String carId);
  Future<Either<Failure, List<CarFirebaseEntity>>> getCars();
}

@LazySingleton(as: CarRepository)
class CarRepositoryImpl implements CarRepository {
  final CarDatasource _carDatasource;

  CarRepositoryImpl() : _carDatasource = CarDatasourceImpl();

  @override
  Future<Option<Failure>> addCar(CarFirebaseEntity carFirebase) async {
    return await handleVoidResponse(
        () async => await _carDatasource.addCar(carFirebase));
  }

  @override
  Future<Option<Failure>> updateCar(CarFirebaseEntity carFirebase) async {
    return await handleVoidResponse(
        () async => await _carDatasource.updateCar(carFirebase));
  }

  @override
  Future<Option<Failure>> deleteCar(String carId) async {
    return await handleVoidResponse(() async {
      final car = await _carDatasource.getCar(carId);
      await _carDatasource.addCar(car,
          customCollection: CollectionsK.carsDeleted);
      await _carDatasource.deleteCar(carId);
    });
  }

  @override
  Future<Either<Failure, List<CarFirebaseEntity>>> getCars() async {
    return await handleResponse(() async => await _carDatasource.getCars());
  }
}
