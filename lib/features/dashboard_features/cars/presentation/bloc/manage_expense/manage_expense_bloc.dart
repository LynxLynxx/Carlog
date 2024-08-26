import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_enum.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/usecases/add_expense_usecase.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/bloc/analytics_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/milage_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/note_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/price_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/usecases/update_milage_usecase.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:carlog/shared/entities/currency_entity.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'manage_expense_bloc.freezed.dart';
part 'manage_expense_event.dart';
part 'manage_expense_state.dart';

class ManageExpenseBloc extends Bloc<ManageExpenseEvent, ManageExpenseState> {
  final AddExpenseUsecase _addExpenseUsecase;
  final UpdateMilageUsecase _updateMilageUsecase;
  final UserAppBloc _userAppBloc;
  final AnalyticsBloc _analyticsBloc;
  final CarsBloc _carsBloc;
  late StreamSubscription userAppBlocSubscription;
  late CarFirebaseEntity? carFirebaseEntity;

  ManageExpenseBloc(this._addExpenseUsecase, this._updateMilageUsecase,
      this._analyticsBloc, this._userAppBloc, this._carsBloc)
      : super(const ManageExpenseState()) {
    on<_ChangeDateEvent>(_onChangeDateEvent);
    on<_ChangeAmountEvent>(_onChangeAmountEvent);
    on<_ChangeMilageEvent>(_onChangeMilageEvent);
    on<_ChangeNoteEvent>(_onChangeNoteEvent);
    on<_ChangeCurrencyEvent>(_onChangeCurrencyEvent);
    on<_ChangeExpenseTypeEvent>(_onChangeExpenseTypeEvent);
    on<_SubmitExpenseEvent>(_onSubmitExpenseEvent);

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

  _onChangeDateEvent(_ChangeDateEvent event, Emitter<ManageExpenseState> emit) {
    emit(
      state.copyWith(date: event.value),
    );
  }

  _onChangeAmountEvent(
      _ChangeAmountEvent event, Emitter<ManageExpenseState> emit) {
    final amount = PriceEntityValidator.pure(event.value);
    emit(
      state.copyWith(amount: amount),
    );
  }

  _onChangeMilageEvent(
      _ChangeMilageEvent event, Emitter<ManageExpenseState> emit) {
    final milage = MilageEntityValidator.pure(event.value);
    emit(
      state.copyWith(milage: milage),
    );
  }

  _onChangeNoteEvent(_ChangeNoteEvent event, Emitter<ManageExpenseState> emit) {
    final note = NoteEntityValidator.pure(event.value);
    emit(
      state.copyWith(note: note),
    );
  }

  _onChangeCurrencyEvent(
      _ChangeCurrencyEvent event, Emitter<ManageExpenseState> emit) {
    emit(
      state.copyWith(currency: event.value),
    );
  }

  _onChangeExpenseTypeEvent(
      _ChangeExpenseTypeEvent event, Emitter<ManageExpenseState> emit) {
    emit(
      state.copyWith(expense: event.value),
    );
  }

  _onSubmitExpenseEvent(
      _SubmitExpenseEvent event, Emitter<ManageExpenseState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await _addExpenseUsecase.call(
      carFirebaseEntity!.carId,
      CarExpenseEntity(
          carExpenseId: const Uuid().v4(),
          amount: state.amount.value,
          currency: state.currency!.code,
          milage: state.milage.value,
          note: state.note.value,
          attachmentPath: "",
          timestamp: state.date,
          createTimestamp: DateTime.now(),
          expense: state.expense),
    );

    if (result.isSome()) {
      return emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: result.asOption().message!));
    }

    emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        message: S.current.successfullyAddedTheActivity));

    if (state.milage.value != "") {
      final milageResult = await _updateMilageUsecase.call(
          carFirebaseEntity!.carId, state.milage.value);
      if (milageResult.isSome()) {
        return emit(state.copyWith(
            status: FormzSubmissionStatus.failure,
            message: result.asOption().message!));
      }
      _carsBloc.add(const CarsEvent.getCars());
      CarFirebaseEntity updatedCar =
          carFirebaseEntity!.copyWith(milage: state.milage.value);
      _userAppBloc.add(UserAppEvent.selectCar(updatedCar));
    }

    _analyticsBloc
        .add(AnalyticsEvent.getExpenses(carId: carFirebaseEntity!.carId));
  }

  @override
  Future<void> close() {
    userAppBlocSubscription.cancel();
    return super.close();
  }
}
