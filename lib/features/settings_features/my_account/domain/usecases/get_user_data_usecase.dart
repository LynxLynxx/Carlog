import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/settings_features/my_account/data/repositories/user_data_repository.dart';
import 'package:carlog/features/settings_features/my_account/domain/entities/user_data_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetUserDataUsecase {
  final UserDataRepository _userDataRepository;

  GetUserDataUsecase({required UserDataRepository userDataRepository})
      : _userDataRepository = userDataRepository;

  Future<Either<Failure, UserDataEntity>> call() async =>
      await _userDataRepository.getUserData();
}
