import 'package:bloc/bloc.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/usecases/delete_expense_usecase.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/usecases/get_expenses_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_bloc.freezed.dart';
part 'analytics_event.dart';
part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final GetExpensesUsecase _getExpensesUsecase;
  final DeleteExpenseUsecase _deleteExpenseUsecase;
  List<CarExpenseEntity> carExpenseList = [];
  AnalyticsBloc(
    this._getExpensesUsecase,
    this._deleteExpenseUsecase,
  ) : super(const _Initial()) {
    on<_GetExpenses>(_onGetExpenses);
    on<_DeleteExpense>(_onDeleteExpense);
  }

  _onGetExpenses(_GetExpenses event, Emitter<AnalyticsState> emit) async {
    emit(const _Loading());
    final result = await _getExpensesUsecase.call(event.carId);
    result.fold((l) => emit(_Failure(l)), (r) {
      carExpenseList = r;
      emit(_Data(r));
    });
  }

  _onDeleteExpense(_DeleteExpense event, Emitter<AnalyticsState> emit) async {
    final result =
        await _deleteExpenseUsecase.call(event.carId, event.carExpenseId);
    if (result.isNone()) {
      final carExpense = carExpenseList
          .indexWhere((element) => element.carExpenseId == event.carExpenseId);
      emit(const _Loading());
      carExpenseList = carExpenseList..removeAt(carExpense);
      emit(_Data(carExpenseList));
    }
  }
}
