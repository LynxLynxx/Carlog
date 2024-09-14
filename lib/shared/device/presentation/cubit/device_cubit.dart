import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_cubit.freezed.dart';
part 'device_state.dart';

class DeviceCubit extends Cubit<DeviceState> {
  DeviceCubit() : super(const _DeviceState()) {
    getDeviceInfo();
  }

  Future<void> getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (kIsWeb) {
        final WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
        emit(state.copyWith(webBrowserInfo: webBrowserInfo));
      } else {
        if (Platform.isAndroid) {
          final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          emit(state.copyWith(androidDeviceInfo: androidInfo));
        } else if (Platform.isIOS) {
          final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
          emit(state.copyWith(iosDeviceInfo: iosInfo));
        } else {}
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
