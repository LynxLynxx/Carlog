part of 'analytics_bloc.dart';

@freezed
class AnalyticsEvent with _$AnalyticsEvent {
  const factory AnalyticsEvent.getExpenses({required String carId}) =
      _GetExpenses;
  const factory AnalyticsEvent.deleteExpense(
      {required String carId, required String carExpenseId}) = _DeleteExpense;
}
