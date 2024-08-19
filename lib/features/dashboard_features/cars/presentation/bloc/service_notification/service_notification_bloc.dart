import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/dashboard_features/cars/domain/repositories/car_repository.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_notification_bloc.freezed.dart';
part 'service_notification_event.dart';
part 'service_notification_state.dart';

class ServiceNotificationBloc
    extends Bloc<ServiceNotificationEvent, ServiceNotificationState> {
  final CarRepository _carRepository;
  ServiceNotificationBloc(this._carRepository)
      : super(const _ServiceNotificationState()) {
    on<_ChangeNotificationStatus>(_onChangeNotificationStatus);
    on<_SetInitialNotificationStatus>(_onSetInitialNotificationStatus);
  }

  _onSetInitialNotificationStatus(_SetInitialNotificationStatus event,
      Emitter<ServiceNotificationState> emit) {
    emit(state.copyWith(notificationStatus: event.notificationStatus));
  }

  _onChangeNotificationStatus(_ChangeNotificationStatus event,
      Emitter<ServiceNotificationState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await _carRepository.changeNotificationOfDayByCarId(
        event.carId, event.actionId, !state.notificationStatus);
    if (result.isSome()) {
      return emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: result.asOption().message!));
    }
    emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        notificationStatus: !state.notificationStatus));
  }
}
