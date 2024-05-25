part of 'cars_bloc.dart';

@freezed
class CarsState with _$CarsState {
  const factory CarsState([
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default([]) List<CarFirebaseEntity> carList,
    String? message,
  ]) = _CarsState;
}
