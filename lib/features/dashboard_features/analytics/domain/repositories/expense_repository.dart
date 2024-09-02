import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/dashboard_features/analytics/data/datasources/expense_datasource.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class ExpenseRepository {
  Future<Either<Failure, List<CarExpenseEntity>>> getExpenses(String carId);
  Future<Option<Failure>> addExpense(String carId, CarExpenseEntity carExpense);
  Future<Option<Failure>> updateExpense(
      String carId, String carExpenseId, Map<String, dynamic> carExpense);
  Future<Option<Failure>> deleteExpense(String carId, String carExpenseId);
}

@LazySingleton(as: ExpenseRepository)
class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseDatasource _expenseDatasource;

  ExpenseRepositoryImpl() : _expenseDatasource = ExpenseDatasourceImpl();

  @override
  Future<Either<Failure, List<CarExpenseEntity>>> getExpenses(
      String carId) async {
    return handleResponse(
        () async => await _expenseDatasource.getExpenses(carId));
  }

  @override
  Future<Option<Failure>> addExpense(
      String carId, CarExpenseEntity carExpense) async {
    return handleVoidResponse(() async =>
        await _expenseDatasource.addExpense(carId, carExpense.toJson()));
  }

  @override
  Future<Option<Failure>> updateExpense(String carId, String carExpenseId,
      Map<String, dynamic> carExpense) async {
    return handleVoidResponse(() async => await _expenseDatasource
        .updateExpense(carId, carExpenseId, carExpense));
  }

  @override
  Future<Option<Failure>> deleteExpense(
      String carId, String carExpenseId) async {
    return handleVoidResponse(() async =>
        await _expenseDatasource.deleteExpense(carId, carExpenseId));
  }
}
