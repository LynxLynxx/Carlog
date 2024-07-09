import 'package:bloc/bloc.dart';
import 'package:carlog/features/other_features/location/domain/location_repository.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';

part 'location_bloc.freezed.dart';
part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository locationRepository;
  LocationBloc(this.locationRepository) : super(const _LocationState()) {
    on<_GetCoordinatesFromLocation>(_onGetCoordinatesFromLocation);
    on<_GetLocationFromCoordinates>(_onGetLocationFromCoordinates);
  }

  _onGetCoordinatesFromLocation(
      _GetCoordinatesFromLocation event, Emitter<LocationState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result =
        await locationRepository.getCoordinatesFromLocation(event.location);
    result.fold(
        (l) => emit(state.copyWith(
            message: l.message, status: FormzSubmissionStatus.failure)),
        (r) => emit(state.copyWith(
            location: r, status: FormzSubmissionStatus.success)));
  }

  _onGetLocationFromCoordinates(
      _GetLocationFromCoordinates event, Emitter<LocationState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await locationRepository.getLocationFromCoordinates(
        event.latitude, event.longitude);
    result.fold(
        (l) => emit(state.copyWith(
            message: l.message, status: FormzSubmissionStatus.failure)),
        (r) => emit(state.copyWith(
            placemark: r, status: FormzSubmissionStatus.success)));
  }
}
