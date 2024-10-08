import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/address_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/coordinates_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/note_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/action/action_bloc.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_entity.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_enum.dart';
import 'package:carlog/features/dashboard_features/home/domain/usecases/add_action_usecase.dart';
import 'package:carlog/features/dashboard_features/home/domain/usecases/update_action_usecase.dart';
import 'package:carlog/features/other_features/location/domain/location_repository.dart';
import 'package:carlog/features/other_features/user_app/presentation/bloc/user_app_bloc.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'manage_action_bloc.freezed.dart';
part 'manage_action_event.dart';
part 'manage_action_state.dart';

class ManageActionBloc extends Bloc<ManageActionEvent, ManageActionState> {
  final AddActionUsecase _addActionUsecase;
  final UpdateActionUsecase _updateActionUsecase;
  final LocationRepository _locationRepository;
  final ActionBloc _actionBloc;
  final UserAppBloc _userAppBloc;
  late StreamSubscription userAppBlocSubscription;
  late CarFirebaseEntity? carFirebaseEntity;
  ManageActionBloc(this._addActionUsecase, this._updateActionUsecase,
      this._locationRepository, this._actionBloc, this._userAppBloc)
      : super(const ManageActionState()) {
    on<_ChangeLatitudeEvent>(_onChangeLatitudeEvent);
    on<_ChangeLongitudeEvent>(_onChangeLongitudeEvent);
    on<_ChangeAddressEvent>(_onChangeAddressEvent);
    on<_ChangeNoteEvent>(_onChangeNoteEvent);
    on<_ChangeActionTypeEvent>(_onChangeActionTypeEvent);
    on<_ChangeDateEvent>(_onChangeDateEvent);
    on<_GenerateAddress>(_onGenerateAddress);
    on<_SubmitActionEvent>(_onSubmitActionEvent);
    on<_SetInitialData>(_onSetInitialData);
    on<_UpdateActionEvent>(_onUpdateActionEvent);
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

  _onChangeLatitudeEvent(
      _ChangeLatitudeEvent event, Emitter<ManageActionState> emit) {
    final latitude = CoordinatesEntityValidator.pure(event.value);
    emit(
      state.copyWith(latitude: latitude),
    );
  }

  _onChangeLongitudeEvent(
      _ChangeLongitudeEvent event, Emitter<ManageActionState> emit) {
    final longitude = CoordinatesEntityValidator.pure(event.value);
    emit(
      state.copyWith(longitude: longitude),
    );
  }

  _onChangeAddressEvent(
      _ChangeAddressEvent event, Emitter<ManageActionState> emit) {
    final address = AddressEntityValidator.pure(event.value);
    emit(
      state.copyWith(address: address),
    );
  }

  _onChangeNoteEvent(_ChangeNoteEvent event, Emitter<ManageActionState> emit) {
    final note = NoteEntityValidator.pure(event.value);
    emit(
      state.copyWith(note: note),
    );
  }

  _onChangeActionTypeEvent(
      _ChangeActionTypeEvent event, Emitter<ManageActionState> emit) {
    emit(
      state.copyWith(action: event.value),
    );
  }

  _onChangeDateEvent(_ChangeDateEvent event, Emitter<ManageActionState> emit) {
    emit(
      state.copyWith(date: event.value),
    );
  }

  _onGenerateAddress(
      _GenerateAddress event, Emitter<ManageActionState> emit) async {
    final latitude =
        CoordinatesEntityValidator.dirty(value: state.latitude.value);
    final longitude =
        CoordinatesEntityValidator.dirty(value: state.longitude.value);

    if (!Formz.validate([latitude, longitude])) {
      return emit(
        state.copyWith(
          latitude: latitude,
          longitude: longitude,
          message: null,
        ),
      );
    }

    String address = "";

    final locationResult = await _locationRepository.getLocationFromCoordinates(
        double.parse(state.latitude.value),
        double.parse(state.longitude.value));

    locationResult.fold(
      (l) => emit(state.copyWith(
          status: FormzSubmissionStatus.failure, message: l.message)),
      (r) => address =
          "${r.street}, ${r.postalCode}, ${r.administrativeArea}, ${r.country}",
    );

    emit(state.copyWith(
        address: AddressEntityValidator.dirty(value: address), message: null));
  }

  _onSubmitActionEvent(
      _SubmitActionEvent event, Emitter<ManageActionState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await _addActionUsecase.call(
      carFirebaseEntity!.carId,
      CarActionEntity(
          carActionId: const Uuid().v4(),
          timestamp: state.date,
          latitude:
              state.action != CarActionEnum.note ? state.latitude.value : null,
          longitude:
              state.action != CarActionEnum.note ? state.longitude.value : null,
          address:
              state.action != CarActionEnum.note ? state.address.value : null,
          note: state.note.value,
          action: state.action),
    );

    if (result.isSome()) {
      return emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: result.asOption().message!));
    }

    emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        message: S.current.successfullyAddedTheActivity));
    _actionBloc.add(ActionEvent.getActions(carId: carFirebaseEntity!.carId));
  }

  _onSetInitialData(_SetInitialData event, Emitter<ManageActionState> emit) {
    emit(state.copyWith(
        latitude: CoordinatesEntityValidator.pure(
            event.carActionEntity.latitude ?? ""),
        longitude: CoordinatesEntityValidator.pure(
            event.carActionEntity.longitude ?? ""),
        note: NoteEntityValidator.pure(event.carActionEntity.note ?? ""),
        address:
            AddressEntityValidator.pure(event.carActionEntity.address ?? ""),
        action: event.carActionEntity.action ?? CarActionEnum.service,
        date: event.carActionEntity.timestamp));
  }

  _onUpdateActionEvent(
      _UpdateActionEvent event, Emitter<ManageActionState> emit) async {
    final result = await _updateActionUsecase.call(
      event.carId,
      event.actionId,
      event.carActionEntity.copyWith(
          latitude:
              state.action != CarActionEnum.note ? state.latitude.value : null,
          longitude:
              state.action != CarActionEnum.note ? state.longitude.value : null,
          address:
              state.action != CarActionEnum.note ? state.address.value : null,
          timestamp: state.date,
          note: state.note.value,
          action: state.action),
    );

    if (result.isSome()) {
      return emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: result.asOption().message!));
    }

    emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        message: S.current.successfullyAddedTheActivity));
    _actionBloc.add(ActionEvent.getActions(carId: carFirebaseEntity!.carId));
  }

  @override
  Future<void> close() {
    userAppBlocSubscription.cancel();
    return super.close();
  }
}
