import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/settings_features/my_account/data/repositories/user_data_repository.dart';
import 'package:carlog/features/settings_features/my_account/domain/entities/update_user_data_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UpdateUserDataUsecase {
  final UserDataRepository _userDataRepository;

  UpdateUserDataUsecase(this._userDataRepository);

  Future<Option<Failure>> call(UpdateUserDataEntity userData) async =>
      await _userDataRepository.updateUserData(userData);
}
