part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.getLocationFromCoordinates(
      double latitude, double longitude) = _GetLocationFromCoordinates;
  const factory LocationEvent.getCoordinatesFromLocation(String location) =
      _GetCoordinatesFromLocation;
}