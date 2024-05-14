part of 'tutorial_index_bloc.dart';

@freezed
class TutorialIndexState with _$TutorialIndexState {
  const factory TutorialIndexState({
    @Default(0) int index,
  }) = _TutorialIndex;
}
