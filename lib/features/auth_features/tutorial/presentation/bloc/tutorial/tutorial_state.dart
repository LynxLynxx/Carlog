part of 'tutorial_bloc.dart';

enum TutorialStatus {
  loading,
  firstEntry,
  nextEntry,
}

@freezed
class TutorialState with _$TutorialState {
  const factory TutorialState({
    @Default(TutorialStatus.loading) TutorialStatus tutorialStatus,
    @Default("") String tutorialErrorMessage,
  }) = _TutorialState;
}
