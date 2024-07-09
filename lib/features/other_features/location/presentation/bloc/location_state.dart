part of 'location_bloc.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState([
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    Placemark? placemark,
    Location? location,
    String? message,
  ]) = _LocationState;
}
