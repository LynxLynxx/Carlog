import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/usecases/get_expenses_usecase.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_bloc.freezed.dart';
part 'analytics_event.dart';
part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final GetExpensesUsecase _getExpensesUsecase;
  final UserAppBloc _userAppBloc;
  late StreamSubscription userAppBlocSubscription;
  late CarFirebaseEntity? carFirebaseEntity;
  AnalyticsBloc(this._getExpensesUsecase, this._userAppBloc)
      : super(const _Initial()) {
    on<_GetExpenses>(_onGetExpenses);
    carFirebaseEntity = _userAppBloc.state.maybeWhen(
      data: (car) => car,
      orElse: () => null,
    );
    userAppBlocSubscription = _userAppBloc.stream.listen((state) {
      state.whenOrNull(
        data: (car) => carFirebaseEntity = car,
      );
    });
  }

  _onGetExpenses(_GetExpenses event, Emitter<AnalyticsState> emit) async {
    emit(const _Loading());
    final result = await _getExpensesUsecase.call(carFirebaseEntity!.carId);
    result.fold((l) => emit(_Failure(l)), (r) => emit(_Data(r)));
  }

  @override
  Future<void> close() {
    userAppBlocSubscription.cancel();
    return super.close();
  }
}
