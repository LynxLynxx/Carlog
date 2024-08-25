import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/repositories/expense_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetExpensesUsecase {
  final ExpenseRepository _expenseRepository;

  GetExpensesUsecase(this._expenseRepository);

  Future<Either<Failure, List<CarExpenseEntity>>> call(String carId) async =>
      await _expenseRepository.getExpenses(carId);
}
