import 'package:bloc/bloc.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/usecases/get_expenses_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_bloc.freezed.dart';
part 'analytics_event.dart';
part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final GetExpensesUsecase _getExpensesUsecase;
  AnalyticsBloc(this._getExpensesUsecase) : super(const _Initial()) {
    on<_GetExpenses>(_onGetExpenses);
  }

  _onGetExpenses(_GetExpenses event, Emitter<AnalyticsState> emit) async {
    emit(const _Loading());
    final result = await _getExpensesUsecase.call(event.carId);
    result.fold((l) => emit(_Failure(l)), (r) => emit(_Data(r)));
  }
}
