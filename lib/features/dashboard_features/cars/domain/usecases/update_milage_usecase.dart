import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/cars/domain/repositories/milage_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UpdateMilageUsecase {
  final MilageRepository _milageRepository;

  UpdateMilageUsecase(this._milageRepository);

  Future<Option<Failure>> call(String carId, int milage) async =>
      await _milageRepository.updateMilage(carId, milage);
}
