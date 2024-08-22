part of 'user_app_bloc.dart';

@freezed
class UserAppEvent with _$UserAppEvent {
  const factory UserAppEvent.selectCar(CarFirebaseEntity carFirebaseEntity) =
      _SelectCar;
  const factory UserAppEvent.readCarFromApp() = _ReadCarFromApp;
  const factory UserAppEvent.resetCarInApp() = _ResetCarInApp;
}
