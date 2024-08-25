part of 'manage_expense_bloc.dart';

@freezed
class ManageExpenseState with _$ManageExpenseState {
  const factory ManageExpenseState([
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(null) DateTime? date,
    @Default(PriceEntityValidator.pure())
    PriceEntityValidator amount,
    @Default(MilageEntityValidator.pure()) MilageEntityValidator milage,
    @Default(NoteEntityValidator.pure()) NoteEntityValidator note,
    @Default(CarExpenseEnum.insuranceFee) CarExpenseEnum expense,
    String? message,
  ]) = _ManageExpenseState;
}
