import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/url_endpoint_extension.dart';
import 'package:carlog/core/router/router.dart';
import 'package:carlog/core/router/routes_constants.dart';
import 'package:carlog/shared/push_notifications/entities/push_notification_entity.dart';
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
    on<_Notification>(_onNotification);
  }

  Future<void> _onNotification(
      _Notification event, Emitter<FcmState> emit) async {
    emit(const _Initial());
    emit(_ShowNotification(event.pushNotification));
  }

  _startListenMessages() async {
    await _fcm.requestPermission(
        provisional: true,
        alert: true,
        sound: true,
        announcement: true,
        criticalAlert: true);
    RemoteMessage? initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      _handleBackgroundMessage(initialMessage);
      // _handleMessage(initialMessage);
    }

    _fcmMessageSub = FirebaseMessaging.onMessage
        .listen((remoteMessage) => _handleMessage(remoteMessage));
    _fcmAppOpenSub = FirebaseMessaging.onMessageOpenedApp
        .listen((remoteMessage) => _handleBackgroundMessage(remoteMessage));
  }

  void _handleBackgroundMessage(RemoteMessage remoteMessage) {
    if (remoteMessage.data.isEmpty) {
      router.go(RoutesK.home);
      return;
    }
    if (remoteMessage.data["url"] != "") {
      String url = remoteMessage.data["url"];
      router.go(getUrlEndpoint(url) ?? RoutesK.home);
    } else {
      router.go(RoutesK.home);
    }
  }

  void _handleMessage(RemoteMessage message) {
    log("FcmBloc $message");
    log("FcmBloc title: ${message.notification?.title}");
    log("FcmBloc body: ${message.notification?.body}");
    log("FcmBloc data: ${message.data.toString()}");
    String? url;
    if (message.data["url"] != "") {
      url = getUrlEndpoint(message.data["url"]);
    } else {
      url = null;
    }

    final PushNotificationEntity pushNotification = PushNotificationEntity(
        title: message.notification!.title!,
        description: message.notification!.body!,
        url: url);
    add(_Notification(pushNotification));
  }

  @override
  Future<void> close() {
    _fcmMessageSub.cancel();
    _fcmAppOpenSub.cancel();
    return super.close();
  }
}
