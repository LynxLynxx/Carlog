import 'package:bloc/bloc.dart';
import 'package:carlog/shared/device/presentation/cubit/device_cubit.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_cubit.freezed.dart';
part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final DeviceCubit _deviceCubit;
  late FirebaseAnalytics _analytics;
  EventsCubit(this._deviceCubit) : super(const EventsState()) {
    _analytics = FirebaseAnalytics.instance;
    _analytics.setAnalyticsCollectionEnabled(true);
  }

  void logEvent(FirebaseEventType event) {
    final deviceInfo = _deviceCubit.state.androidDeviceInfo ??
        _deviceCubit.state.iosDeviceInfo ??
        _deviceCubit.state.webBrowserInfo;
    _analytics.logEvent(name: event.name, parameters: {
      'deviceInfo': deviceInfo?.data.toString() ?? "",
    });
  }
}
