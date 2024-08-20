import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/address_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/coordinates_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/repositories/car_repository.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_entity.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_enum.dart';
import 'package:carlog/features/other_features/location/domain/location_repository.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_action_bloc.freezed.dart';
part 'manage_action_event.dart';
part 'manage_action_state.dart';

class ManageActionBloc extends Bloc<ManageActionEvent, ManageActionState> {
  final CarRepository _carRepository;
  final LocationRepository _locationRepository;
  ManageActionBloc(
      this._carRepository, this._locationRepository)
      : super(const ManageActionState()) {
    on<_ChangeLatitudeEvent>(_onChangeLatitudeEvent);
    on<_ChangeLongitudeEvent>(_onChangeLongitudeEvent);
    on<_ChangeAddressEvent>(_onChangeAddressEvent);
    on<_ChangeActionTypeEvent>(_onChangeActionTypeEvent);
    on<_GenerateAddress>(_onGenerateAddress);
    on<_SubmitActionEvent>(_onSubmitActionEvent);
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

  _onChangeActionTypeEvent(
      _ChangeActionTypeEvent event, Emitter<ManageActionState> emit) {
    emit(
      state.copyWith(action: event.value),
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
    final result = await _carRepository.addCarActionsByCarId(
      "Psi7UTfL47sgp1usWGn3",
      CarActionEntity(
          timestamp: DateTime.now().add(const Duration(days: 3)),
          latitude: state.latitude.value != "" ? state.latitude.value : null,
          longitude: state.longitude.value != "" ? state.longitude.value : null,
          address: state.address.value != "" ? state.address.value : null,
          action: CarActionEnum.service),
    );

    if (result.isSome()) {
      return emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: result.asOption().message!));
    }

    emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        message: S.current.successfullyAddedTheActivity));
  }
}
