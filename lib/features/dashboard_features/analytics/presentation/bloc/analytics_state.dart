part of 'analytics_bloc.dart';

@freezed
class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState.initial() = _Initial;
  const factory AnalyticsState.loading() = _Loading;
  const factory AnalyticsState.data(final List<CarExpenseEntity> carExpenseList) = _Data;
  const factory AnalyticsState.failure(final Failure failure) = _Failure;
}
