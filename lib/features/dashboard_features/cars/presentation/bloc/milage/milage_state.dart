part of 'milage_bloc.dart';

@freezed
class MilageState with _$MilageState {
  const factory MilageState([
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(MilageEntityValidator.pure()) MilageEntityValidator milage,
    String? message,
  ]) = _MilageState;
}
