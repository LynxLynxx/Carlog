import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_entity.dart';
import 'package:carlog/features/dashboard_features/home/domain/repositories/action_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UpdateActionUsecase {
  final ActionRepository _actionRepository;

  UpdateActionUsecase(this._actionRepository);

  Future<Option<Failure>> call(String carId, String actionId,
          CarActionEntity carActionEntity) async =>
      await _actionRepository.updateAction(carId, actionId, carActionEntity);
}
