part of 'manage_action_bloc.dart';

@freezed
class ManageActionEvent with _$ManageActionEvent {
  const factory ManageActionEvent.changeLatitude(String value) = _ChangeLatitudeEvent;
  const factory ManageActionEvent.changeLongitude(String value) = _ChangeLongitudeEvent;
  const factory ManageActionEvent.changeAddress(String value) = _ChangeAddressEvent;
  const factory ManageActionEvent.changeActionType(CarActionEnum value) = _ChangeActionTypeEvent;
  const factory ManageActionEvent.generateAddress() = _GenerateAddress;
  const factory ManageActionEvent.submitActionEvent() = _SubmitActionEvent;
}