part of 'tutorial_bloc.dart';

@freezed
class TutorialEvent with _$TutorialEvent {
  const factory TutorialEvent.writeFirstEntryToApp() = _WriteFirstEntryToApp;
  const factory TutorialEvent.resetFirstEntryToApp() = _ResetFirstEntryToApp;
  const factory TutorialEvent.readFirstEntryToApp() = _ReadFirstEntryToApp;
}
