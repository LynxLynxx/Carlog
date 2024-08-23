import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/domain/repositories/car_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetCarsUsecase {
  final CarRepository _carRepository;

  GetCarsUsecase(this._carRepository);

  Future<Either<Failure, List<CarFirebaseEntity>>> call() async =>
      await _carRepository.getCars();
}
