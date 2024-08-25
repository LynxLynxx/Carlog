import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_day_entity.dart';
import 'package:carlog/features/dashboard_features/home/domain/repository/action_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetActionsUsecase {
  final ActionRepository _actionRepository;

  GetActionsUsecase(this._actionRepository);

  Future<Either<Failure, List<CarActionDayEntity>>> call(String carId) async =>
      await _actionRepository.getActions(carId);
}
