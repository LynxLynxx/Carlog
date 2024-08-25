import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/domain/repositories/car_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UpdateCarUsecase {
  final CarRepository _carRepository;

  UpdateCarUsecase(this._carRepository);

  Future<Option<Failure>> call(CarFirebaseEntity carFirebase) async =>
      await _carRepository.updateCar(carFirebase);
}
