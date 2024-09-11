import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/auth_features/shared/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteAccountUsecase {
  final AuthRepository _authRepository;

  DeleteAccountUsecase(this._authRepository);

  Future<Option<Failure>> call() async => await _authRepository.deleteAccount();
}
