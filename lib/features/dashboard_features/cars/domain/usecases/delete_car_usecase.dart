import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/cars/domain/repositories/car_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteCarUsecase {
  final CarRepository _carRepository;

  DeleteCarUsecase(this._carRepository);

  Future<Option<Failure>> call(String carId) async =>
      await _carRepository.deleteCar(carId);
}
