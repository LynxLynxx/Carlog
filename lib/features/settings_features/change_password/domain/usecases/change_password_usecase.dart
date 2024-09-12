import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/auth_features/shared/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ChangePasswordUsecase {
  final AuthRepository _authRepository;

  ChangePasswordUsecase(this._authRepository);

  Future<Option<Failure>> call(String password) async =>
      await _authRepository.changePassword(password: password);
}
