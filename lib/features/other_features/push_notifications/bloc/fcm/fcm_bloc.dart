import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_bloc.freezed.dart';
part 'fcm_event.dart';
part 'fcm_state.dart';

class FcmBloc extends Bloc<FcmEvent, FcmState> {
  final FirebaseMessaging _fcm;
  late StreamSubscription _fcmMessageSub;
  late StreamSubscription _fcmAppOpenSub;
  RemoteMessage? initialMessage;
  FcmBloc()
      : _fcm = FirebaseMessaging.instance,
        super(const _Initial()) {
    _startListenMessages();
  }

  _startListenMessages() async {
    await _fcm.requestPermission(provisional: true);
    RemoteMessage? initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    _fcmMessageSub = FirebaseMessaging.onMessage
        .listen((remoteMessage) => _handleMessage(remoteMessage));
    _fcmAppOpenSub =
        FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {});
  }

  void _handleMessage(RemoteMessage message) {
    log("FcmBloc $message");
  }

  @override
  Future<void> close() {
    _fcmMessageSub.cancel();
    _fcmAppOpenSub.cancel();
    return super.close();
  }
}
