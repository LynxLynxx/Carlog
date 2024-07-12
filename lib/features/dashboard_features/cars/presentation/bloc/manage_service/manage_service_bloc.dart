import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/coordinates_entity_validator.dart';
import 'package:carlog/features/dashboard_features/cars/domain/repositories/car_repository.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_entity.dart';
import 'package:carlog/features/dashboard_features/home/domain/entities/car_action_enum.dart';
import 'package:carlog/features/other_features/location/domain/location_repository.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_service_bloc.freezed.dart';
part 'manage_service_event.dart';
part 'manage_service_state.dart';

class ManageServiceBloc extends Bloc<ManageServiceEvent, ManageServiceState> {
  final CarRepository _carRepository;
  final LocationRepository _locationRepository;
  ManageServiceBloc(this._carRepository, this._locationRepository)
      : super(const ManageServiceState()) {
    on<_ChangeLatitudeEvent>(_onChangeLatitudeEvent);
    on<_ChangeLongitudeEvent>(_onChangeLongitudeEvent);
    on<_ChangeServiceTypeEvent>(_onChangeServiceTypeEvent);
    on<_SubmitServiceEvent>(_onSubmitServiceEvent);
  }

  _onChangeLatitudeEvent(
      _ChangeLatitudeEvent event, Emitter<ManageServiceState> emit) {
    final latitude = CoordinatesEntityValidator.pure(event.value);
    emit(
      state.copyWith(latitude: latitude),
    );
  }

  _onChangeLongitudeEvent(
      _ChangeLongitudeEvent event, Emitter<ManageServiceState> emit) {
    final longitude = CoordinatesEntityValidator.pure(event.value);
    emit(
      state.copyWith(longitude: longitude),
    );
  }

  _onChangeServiceTypeEvent(
      _ChangeServiceTypeEvent event, Emitter<ManageServiceState> emit) {
    emit(
      state.copyWith(action: event.value),
    );
  }

  _onSubmitServiceEvent(
      _SubmitServiceEvent event, Emitter<ManageServiceState> emit) async {
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

    final result = await _carRepository.addCarActionsByCarId(
      "Psi7UTfL47sgp1usWGn3",
      CarActionEntity(
          timestamp: DateTime.now()
              .add(const Duration(days: 3))
              .millisecondsSinceEpoch,
          latitude: state.latitude.value != "" ? state.latitude.value : null,
          longitude: state.longitude.value != "" ? state.longitude.value : null,
          address: address,
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
    // carsBloc.add(const CarsEvent.getCars());
  }
}
