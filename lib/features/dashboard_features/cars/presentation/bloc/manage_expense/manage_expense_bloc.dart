import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/core/utils/currencies.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_entity.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/entities/car_expense_enum.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/usecases/add_expense_usecase.dart';
import 'package:carlog/features/dashboard_features/analytics/domain/usecases/update_expenses_usecase.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/bloc/analytics_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/milage_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/note_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/price_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/usecases/update_milage_usecase.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/other_features/file/domain/usecases/upload_file_usecase.dart';
import 'package:carlog/features/other_features/file/presentation/bloc/file_bloc.dart';
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
  final UploadFileUsecase _uploadFileUsecase;
  final UpdateExpensesUsecase _updateExpensesUsecase;
  final UpdateMilageUsecase _updateMilageUsecase;
  final UserAppBloc _userAppBloc;
  final AnalyticsBloc _analyticsBloc;
  final CarsBloc _carsBloc;
  final FileBloc _fileBloc;

  late StreamSubscription userAppBlocSubscription;
  late StreamSubscription fileBlocSubscription;
  late CarFirebaseEntity? carFirebaseEntity;
  late File? fileEntity;

  ManageExpenseBloc(
      this._addExpenseUsecase,
      this._uploadFileUsecase,
      this._updateExpensesUsecase,
      this._updateMilageUsecase,
      this._analyticsBloc,
      this._userAppBloc,
      this._carsBloc,
      this._fileBloc)
      : super(const ManageExpenseState()) {
    on<_ChangeDateEvent>(_onChangeDateEvent);
    on<_ChangeAmountEvent>(_onChangeAmountEvent);
    on<_ChangeMilageEvent>(_onChangeMilageEvent);
    on<_ChangeNoteEvent>(_onChangeNoteEvent);
    on<_ChangeCurrencyEvent>(_onChangeCurrencyEvent);
    on<_ChangeExpenseTypeEvent>(_onChangeExpenseTypeEvent);
    on<_SubmitExpenseEvent>(_onSubmitExpenseEvent);
    on<_EditManageEvent>(_onEditManageEvent);

    carFirebaseEntity = _userAppBloc.state.maybeWhen(
      data: (car) => car,
      orElse: () => null,
    );
    userAppBlocSubscription = _userAppBloc.stream.listen((state) {
      state.whenOrNull(
        data: (car) => carFirebaseEntity = car,
      );
    });

    fileEntity = _fileBloc.state.maybeWhen(
      data: (file) => file,
      orElse: () => null,
    );
    fileBlocSubscription = _fileBloc.stream.listen((state) {
      state.whenOrNull(
        data: (file) => fileEntity = file,
      );
    });
  }

  _onEditManageEvent(_EditManageEvent event, Emitter<ManageExpenseState> emit) {
    emit(
      state.copyWith(
        amount: PriceEntityValidator.pure(event.value.amount.toString()),
        milage: MilageEntityValidator.pure(
            event.value.milage == null ? "" : event.value.milage.toString()),
        note: NoteEntityValidator.pure(event.value.note.toString()),
        date: event.value.timestamp!,
        expense: event.value.expense!,
        currency: CurrencyEntity.fromJson(CurrenciesK.currencies
            .firstWhere((e) => e["code"] == event.value.currency)),
      ),
    );
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

    String? imagePath;
    String carExpenseId = const Uuid().v4();

    if (event.update != null) {
      carExpenseId = event.update!.carExpenseId;
      final result = await _updateExpensesUsecase.call(
          carFirebaseEntity!.carId,
          event.update!.carExpenseId,
          CarExpenseEntity(
            carExpenseId: event.update!.carExpenseId,
            amount: int.tryParse(state.amount.value),
            currency: state.currency?.code,
            milage: int.tryParse(state.milage.value),
            note: state.note.value,
            attachmentPath: "",
            timestamp: state.date,
            expense: state.expense,
          ).toJson());

      if (result.isSome()) {
        return emit(state.copyWith(
            status: FormzSubmissionStatus.failure,
            message: result.asOption().message!));
      }
    } else {
      final result = await _addExpenseUsecase.call(
        carFirebaseEntity!.carId,
        CarExpenseEntity(
            carExpenseId: carExpenseId,
            amount: int.tryParse(state.amount.value),
            currency: state.currency!.code,
            milage: int.tryParse(state.milage.value),
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
    }
    emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        message: S.current.successfullyAddedTheActivity));

    if (state.milage.value != "") {
      final milageResult = await _updateMilageUsecase.call(
          carFirebaseEntity!.carId, int.tryParse(state.milage.value)!);
      if (milageResult.isSome()) {
        return emit(state.copyWith(
            status: FormzSubmissionStatus.failure,
            message: milageResult.asOption().message!));
      }
      _carsBloc.add(const CarsEvent.getCars());
      CarFirebaseEntity updatedCar =
          carFirebaseEntity!.copyWith(milage: int.tryParse(state.milage.value));
      _userAppBloc.add(UserAppEvent.selectCar(updatedCar));
    }

    if (fileEntity != null) {
      final imageResult = await _uploadFileUsecase.call(fileEntity!);
      imageResult.fold((l) => log(l.message.toString()), (r) async {
        imagePath = r;
      });

      if (imagePath != "") {
        final updateExpenseResult = await _updateExpensesUsecase
            .call(carFirebaseEntity!.carId, carExpenseId, {
          "attachmentPath": imagePath,
        });
        if (updateExpenseResult.isSome()) {
          log("An error has occured: ${updateExpenseResult.asOption().message}");
        }
      }
    }

    _analyticsBloc
        .add(AnalyticsEvent.getExpenses(carId: carFirebaseEntity!.carId));
    emit(state.copyWith(status: FormzSubmissionStatus.success));
  }

  @override
  Future<void> close() {
    userAppBlocSubscription.cancel();
    fileBlocSubscription.cancel();
    return super.close();
  }
}
