part of 'device_cubit.dart';

@freezed
class DeviceState with _$DeviceState {
  const factory DeviceState({
    @Default(null) AndroidDeviceInfo? androidDeviceInfo,
    @Default(null) IosDeviceInfo? iosDeviceInfo,
    @Default(null) WebBrowserInfo? webBrowserInfo,
  }) = _DeviceState;
}
