import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/repositories/expense_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AddExpenseUsecase {
  final ExpenseRepository _expenseRepository;

  AddExpenseUsecase(this._expenseRepository);

  Future<Option<Failure>> call(
          String carId, CarExpenseEntity carExpense) async =>
      await _expenseRepository.addExpense(carId, carExpense);
}
