part of 'analytics_bloc.dart';

@freezed
class AnalyticsEvent with _$AnalyticsEvent {
  const factory AnalyticsEvent.getExpenses() = _GetExpenses;
}
