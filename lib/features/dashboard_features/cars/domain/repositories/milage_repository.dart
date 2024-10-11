import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/dashboard_features/cars/data/datasources/milage_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class MilageRepository {
  Future<Option<Failure>> updateMilage(String carId, int milage);
}

@LazySingleton(as: MilageRepository)
class MilageRepositoryImpl implements MilageRepository {
  final MilageDatasource _milageDatasource;

  MilageRepositoryImpl() : _milageDatasource = MilageDatasourceImpl();
  @override
  Future<Option<Failure>> updateMilage(String carId, int milage) async {
    return await handleVoidResponse(
        () async => await _milageDatasource.updateMilage(carId, milage));
  }
}
