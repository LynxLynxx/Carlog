part of 'manage_service_bloc.dart';

@freezed
class ManageServiceEvent with _$ManageServiceEvent {
  const factory ManageServiceEvent.changeLatitude(String value) = _ChangeLatitudeEvent;
  const factory ManageServiceEvent.changeLongitude(String value) = _ChangeLongitudeEvent;
  const factory ManageServiceEvent.changeServiceType(CarActionEnum value) = _ChangeServiceTypeEvent;
  const factory ManageServiceEvent.submitServiceEvent() = _SubmitServiceEvent;
}