import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/auth_features/shared/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ReauthenticateUserUsecase {
  final AuthRepository _authRepository;

  ReauthenticateUserUsecase(this._authRepository);

  Future<Option<Failure>> call(String password) async =>
      await _authRepository.reAuthenticateUser(password: password);
}
