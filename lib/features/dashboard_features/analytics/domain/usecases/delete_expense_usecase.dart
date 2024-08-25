import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/repositories/expense_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteExpenseUsecase {
  final ExpenseRepository _expenseRepository;

  DeleteExpenseUsecase(this._expenseRepository);

  Future<Option<Failure>> call(String carId, String carExpenseId) async =>
      await _expenseRepository.deleteExpense(carId, carExpenseId);
}
