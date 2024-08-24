part of 'user_app_bloc.dart';

@freezed
class UserAppState with _$UserAppState {
  const factory UserAppState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    CarFirebaseEntity? car,
}) = _UserAppState;
}
