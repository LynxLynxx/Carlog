import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/milage_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/usecases/update_milage_usecase.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'milage_bloc.freezed.dart';
part 'milage_event.dart';
part 'milage_state.dart';

class MilageBloc extends Bloc<MilageEvent, MilageState> {
  final UpdateMilageUsecase _updateMilageUsecase;
  final UserAppBloc _userAppBloc;
  final CarsBloc _carsBloc;
  late StreamSubscription userAppBlocSubscription;
  late CarFirebaseEntity? carFirebaseEntity;
  MilageBloc(this._updateMilageUsecase, this._userAppBloc, this._carsBloc)
      : super(const _MilageState()) {
    on<_ChangeMilageEvent>(_onChangeMilageEvent);
    on<_SubmitMilageChangeEvent>(_onSubmitMilageChangeEvent);
    carFirebaseEntity = _userAppBloc.state.car;
    userAppBlocSubscription = _userAppBloc.stream.listen((state) {
      carFirebaseEntity = state.car!;
    });
  }

  _onChangeMilageEvent(_ChangeMilageEvent event, Emitter<MilageState> emit) {
    final milage = MilageEntityValidator.pure(event.value);
    emit(
      state.copyWith(
        milage: milage,
      ),
    );
  }

  _onSubmitMilageChangeEvent(
      _SubmitMilageChangeEvent event, Emitter<MilageState> emit) async {
    final milage = MilageEntityValidator.dirty(value: state.milage.value);

    if (!Formz.validate([milage])) {
      return emit(state.copyWith(milage: milage, message: null));
    }

    final result = await _updateMilageUsecase.call(
        carFirebaseEntity!.carId, state.milage.value);

    if (result.isSome()) {
      return emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: result.asOption().message!));
    }

    emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        message: S.current.successfullyUpdatedTheMilage));

    _carsBloc.add(const CarsEvent.getCars());
    CarFirebaseEntity updatedCar =
        carFirebaseEntity!.copyWith(milage: state.milage.value);
    _userAppBloc.add(UserAppEvent.selectCar(updatedCar));
  }

  @override
  Future<void> close() {
    userAppBlocSubscription.cancel();
    return super.close();
  }
}
