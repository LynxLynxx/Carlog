part of 'manage_expense_bloc.dart';

@freezed
class ManageExpenseEvent with _$ManageExpenseEvent {
  const factory ManageExpenseEvent.changeDate(DateTime value) =
      _ChangeDateEvent;
  const factory ManageExpenseEvent.changeAmountEvent(String value) =
      _ChangeAmountEvent;
  const factory ManageExpenseEvent.changeMilageEvent(String value) =
      _ChangeMilageEvent;
  const factory ManageExpenseEvent.changeNote(String value) = _ChangeNoteEvent;
  const factory ManageExpenseEvent.changeCurrency(CurrencyEntity value) =
      _ChangeCurrencyEvent;
  const factory ManageExpenseEvent.changeExpenseType(CarExpenseEnum value) =
      _ChangeExpenseTypeEvent;
  const factory ManageExpenseEvent.submitExpenseEvent(
      {CarExpenseEntity? update}) = _SubmitExpenseEvent;

  const factory ManageExpenseEvent.editManage(CarExpenseEntity value) =
      _EditManageEvent;
}
