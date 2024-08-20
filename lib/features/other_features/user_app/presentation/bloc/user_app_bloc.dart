import 'package:bloc/bloc.dart';
import 'package:carlog/core/services/secure_storage_service.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/action/action_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_app_bloc.freezed.dart';
part 'user_app_event.dart';
part 'user_app_state.dart';

class UserAppBloc extends Bloc<UserAppEvent, UserAppState> {
  final SecureStorageService secureStorageService;
  final ActionBloc serviceBloc;
  UserAppBloc(this.secureStorageService, this.serviceBloc)
      : super(const _UserAppState()) {
    on<_SelectCar>(_onSelectCar);
    on<_ReadCarFromApp>(_onReadCarFromApp);
    on<_ResetCarInApp>(_onResetCarInApp);
  }

  _onSelectCar(_SelectCar event, Emitter<UserAppState> emit) async {
    await secureStorageService.writeCarToApp(event.carFirebaseEntity);
    serviceBloc
        .add(ActionEvent.getActions(carId: event.carFirebaseEntity.carId));
    emit(state.copyWith(car: event.carFirebaseEntity));
  }

  _onReadCarFromApp(_ReadCarFromApp event, Emitter<UserAppState> emit) async {
    final car = await secureStorageService.readCarFromApp();
    serviceBloc.add(ActionEvent.getActions(carId: car.carId));
    emit(state.copyWith(car: car));
  }

  _onResetCarInApp(_ResetCarInApp event, Emitter<UserAppState> emit) async {
    await secureStorageService.resetCarInApp();
    emit(state.copyWith(car: null));
  }
}
