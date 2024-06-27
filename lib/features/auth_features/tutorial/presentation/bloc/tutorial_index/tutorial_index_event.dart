part of 'tutorial_index_bloc.dart';

@freezed
class TutorialIndexEvent with _$TutorialIndexEvent {
  const factory TutorialIndexEvent.changeIndex(int index) = _ChangeIndex;
}
