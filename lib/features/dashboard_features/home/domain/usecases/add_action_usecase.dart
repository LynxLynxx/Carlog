import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_entity.dart';
import 'package:carlog/features/dashboard_features/home/domain/repositories/action_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AddActionUsecase {
  final ActionRepository _actionRepository;

  AddActionUsecase(this._actionRepository);

  Future<Option<Failure>> call(String carId, CarActionEntity carAction) async =>
      await _actionRepository.addAction(carId, carAction);
}
