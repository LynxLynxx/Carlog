import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/services/secure_storage_service.dart';
import 'package:carlog/features/dashboard_features/analytics/presentation/bloc/analytics_bloc.dart';
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
  final AnalyticsBloc analyticsBloc;
  final CarsBloc carsBloc;
  late StreamSubscription carListSubscription;
  late List<CarFirebaseEntity>? carFirebaseEntityList;
  UserAppBloc(this.secureStorageService, this.serviceBloc, this.analyticsBloc,
      this.carsBloc)
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
    analyticsBloc
        .add(AnalyticsEvent.getExpenses(carId: event.carFirebaseEntity.carId));
    emit(_Data(event.carFirebaseEntity));
  }

  _onReadCarFromApp(_ReadCarFromApp event, Emitter<UserAppState> emit) async {
    emit(const _Loading());
    final car = await secureStorageService.readCarFromApp();
    CarFirebaseEntity? firstCarFromFirebase;
    if (carFirebaseEntityList != null) {
      if (carFirebaseEntityList!.isNotEmpty) {
        firstCarFromFirebase = carFirebaseEntityList!.first;
      }
    }

    if (car == null) {
      if (carFirebaseEntityList?.isEmpty ?? true) {
        emit(const _Data(null));
      } else {
        add(_SelectCar(firstCarFromFirebase!));
      }
      return;
    }

    if (carFirebaseEntityList!.isEmpty) {
      emit(const _Data(null));
      return;
    }

    final isCarInFirebaseList = carFirebaseEntityList!.contains(car);
    final currentFirebaseCar = carFirebaseEntityList!.firstWhere(
      (element) => element.carId == car.carId,
      orElse: () => firstCarFromFirebase!,
    );

    if (!isCarInFirebaseList || currentFirebaseCar != car) {
      add(_SelectCar(currentFirebaseCar));
      return;
    }

    final selectedCarId = car.carId;

    serviceBloc.add(ActionEvent.getActions(carId: selectedCarId));
    analyticsBloc.add(AnalyticsEvent.getExpenses(carId: selectedCarId));

    emit(_Data(car));
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
