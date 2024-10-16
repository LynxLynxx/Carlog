import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:carlog/core/di/injectable_config.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/shared/push_notifications/domain/usecase/save_token_usecase.dart';
import 'package:carlog/shared/push_notifications/entities/fcm_token_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

part 'fcm_token_bloc.freezed.dart';
part 'fcm_token_event.dart';
part 'fcm_token_state.dart';

class FcmTokenBloc extends Bloc<FcmTokenEvent, FcmTokenState> {
  final FirebaseMessaging _fcm;
  final FcmTokenUsecase _fcmTokenUsecase;

  FcmTokenBloc()
      : _fcm = FirebaseMessaging.instance,
        _fcmTokenUsecase = FcmTokenUsecase(locator()),
        super(const _Initial()) {
    on<_Started>(_onStarted);
    add(const _Started());
  }

  _onStarted(_Started event, Emitter<FcmTokenState> emit) async {
    emit(const _Loading());
    await initFcmTokenSubscription();
    String? fcmToken = await _fcm.getToken();
    if (fcmToken == null) return;
    log("FcmTokenBloc: $fcmToken");
    FcmTokenEntity fcmTokenEntity = FcmTokenEntity();
    if (Platform.isIOS) {
      fcmTokenEntity = fcmTokenEntity.copyWith(iosToken: fcmToken);
    }
    if (Platform.isAndroid) {
      fcmTokenEntity = fcmTokenEntity.copyWith(androidToken: fcmToken);
    }
    _fcmTokenUsecase.call(
        fcmTokenEntity, FirebaseAuth.instance.currentUser!.uid);

    await close();
  }

  Future<void> initFcmTokenSubscription() async {
    final apnsToken = await _fcm.getAPNSToken();
    await Future.delayed(const Duration(seconds: 5));
    if (apnsToken == null && Platform.isIOS) {
      throw FirebaseException(
        plugin: 'firebase_messaging',
        code: 'apns-token-not-set',
        message:
            'APNS token has not been set yet. Please ensure the APNS token is available by calling `getAPNSToken()`.',
      );
    }
    final pushNotificationPermission = await Permission.notification.status;
    if (pushNotificationPermission != PermissionStatus.granted) {
      //TODO check iOS
      // ignore: unused_local_variable
      final requestPermission = await Permission.notification.request();
      // if (requestPermission.isPermanentlyDenied) {
      //   openAppSettings();
      // }
    }
  }
}
