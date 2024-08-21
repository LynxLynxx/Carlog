import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/settings_features/my_account/data/datasources/user_data_datasource.dart';
import 'package:carlog/features/settings_features/my_account/domain/entities/update_user_data_entity.dart';
import 'package:carlog/features/settings_features/my_account/domain/entities/user_data_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class UserDataRepository {
  Future<Either<Failure, UserDataEntity>> getUserData();
  Future<Option<Failure>> updateUserData(UpdateUserDataEntity userData);
}

@LazySingleton(as: UserDataRepository)
class UserDataRepositoryImpl implements UserDataRepository {
  final UserDataDatasource _userDataDatasource;

  UserDataRepositoryImpl() : _userDataDatasource = UserDataDatasourceImpl();
  @override
  Future<Either<Failure, UserDataEntity>> getUserData() async {
    return await handleResponse(
        () async => await _userDataDatasource.getUserData());
  }

  @override
  Future<Option<Failure>> updateUserData(UpdateUserDataEntity userData) async {
    return await handleVoidResponse(
        () async => await _userDataDatasource.updateUserData(userData));
  }
}
