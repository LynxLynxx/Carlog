import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_token_bloc.freezed.dart';
part 'fcm_token_event.dart';
part 'fcm_token_state.dart';

class FcmTokenBloc extends Bloc<FcmTokenEvent, FcmTokenState> {
  final FirebaseMessaging _fcm;
  // final UpdateFcmTokenUsecase updateFcmTokenUsecase;
  FcmTokenBloc()
      : _fcm = FirebaseMessaging.instance,
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

    await close();
  }

  Future<void> initFcmTokenSubscription() async {
    final apnsToken = await _fcm.getAPNSToken();
    if (apnsToken == null && Platform.isIOS) {
      throw FirebaseException(
        plugin: 'firebase_messaging',
        code: 'apns-token-not-set',
        message:
            'APNS token has not been set yet. Please ensure the APNS token is available by calling `getAPNSToken()`.',
      );
    }
  }
}
