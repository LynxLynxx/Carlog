import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/domain/repositories/car_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AddCarUsecase {
  final CarRepository _carRepository;

  AddCarUsecase(this._carRepository);

  Future<Option<Failure>> call(CarFirebaseEntity carFirebase) async =>
      await _carRepository.addCar(carFirebase);
}
