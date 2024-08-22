part of 'milage_bloc.dart';

@freezed
class MilageEvent with _$MilageEvent {
  const factory MilageEvent.changeMilage(String value) = _ChangeMilageEvent;
  const factory MilageEvent.submitMilageChangeEvent() =
      _SubmitMilageChangeEvent;
}
