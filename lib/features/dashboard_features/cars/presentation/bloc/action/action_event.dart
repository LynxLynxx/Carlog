part of 'action_bloc.dart';

@freezed
class ActionEvent with _$ActionEvent {
  const factory ActionEvent.getActions({required String carId}) = _GetActions;
}
