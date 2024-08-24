part of 'manage_action_bloc.dart';

@freezed
class ManageActionState with _$ManageActionState {
  const factory ManageActionState([
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(CoordinatesEntityValidator.pure())
    CoordinatesEntityValidator latitude,
    @Default(CoordinatesEntityValidator.pure())
    CoordinatesEntityValidator longitude,
    @Default(AddressEntityValidator.pure()) AddressEntityValidator address,
    @Default(NoteEntityValidator.pure()) NoteEntityValidator note,
    @Default(null) DateTime? date,
    @Default(CarActionEnum.service) CarActionEnum action,
    String? message,
  ]) = _ManageActionState;
}
