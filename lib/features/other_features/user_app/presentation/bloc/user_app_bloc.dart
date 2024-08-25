import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/services/secure_storage_service.dart';
import 'package:carlog/features/dashboard_features/cars/domain/entities/car_firebase_entity.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/action/action_bloc.dart';
import 'package:carlog/features/dashboard_features/cars/presentation/bloc/cars/cars_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_app_bloc.freezed.dart';
part 'user_app_event.dart';
part 'user_app_state.dart';

class UserAppBloc extends Bloc<UserAppEvent, UserAppState> {
  final SecureStorageService secureStorageService;
  final ActionBloc serviceBloc;
  final CarsBloc carsBloc;
  late StreamSubscription carListSubscription;
  late List<CarFirebaseEntity>? carFirebaseEntityList;
  UserAppBloc(this.secureStorageService, this.serviceBloc, this.carsBloc)
      : super(const _Initial()) {
    on<_SelectCar>(_onSelectCar);
    on<_ReadCarFromApp>(_onReadCarFromApp);
    on<_ResetCarInApp>(_onResetCarInApp);
    carsBloc.state
        .whenOrNull(data: (carList) => carFirebaseEntityList = carList);

    carListSubscription = carsBloc.stream.listen((state) {
      carsBloc.state.whenOrNull(data: (carList) {
        carFirebaseEntityList = carList;
        add(const _ReadCarFromApp());
        return;
      });
    });
  }

  _onSelectCar(_SelectCar event, Emitter<UserAppState> emit) async {
    emit(const _Loading());
    await secureStorageService.writeCarToApp(event.carFirebaseEntity);
    serviceBloc
        .add(ActionEvent.getActions(carId: event.carFirebaseEntity.carId));
    emit(_Data(event.carFirebaseEntity));
  }

  _onReadCarFromApp(_ReadCarFromApp event, Emitter<UserAppState> emit) async {
    emit(const _Loading());
    final car = await secureStorageService.readCarFromApp();
    if (car == null && carFirebaseEntityList!.isEmpty) {
      return emit(const _Data(null));
    }
    if (car == null && carFirebaseEntityList!.isNotEmpty) {
      add(_SelectCar(carFirebaseEntityList!.first));
      return;
    }
    if (carFirebaseEntityList!.isNotEmpty) {
      final currentFirebaseCar = carFirebaseEntityList!.firstWhere((element) {
        return element.carId == car!.carId;
      });
      if (currentFirebaseCar != car) {
        add(_SelectCar(currentFirebaseCar));
        return;
      }
    }
    serviceBloc.add(ActionEvent.getActions(
        carId: car?.carId ?? carFirebaseEntityList!.first.carId));
    emit(_Data(
      car ?? carFirebaseEntityList!.first,
    ));
  }

  _onResetCarInApp(_ResetCarInApp event, Emitter<UserAppState> emit) async {
    await secureStorageService.resetCarInApp();
    return emit(const _Data(null));
  }

  @override
  Future<void> close() {
    carListSubscription.cancel();
    return super.close();
  }
}
