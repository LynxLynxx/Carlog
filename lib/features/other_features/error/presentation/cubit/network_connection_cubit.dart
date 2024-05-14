import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_connection_cubit.freezed.dart';
part 'network_connection_state.dart';

class NetworkConnectionCubit extends Cubit<NetworkConnectionState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? streamSubscription;
  NetworkConnectionCubit() : super(const _NetworkConnectionState()) {
    streamSubscription = connectivity.onConnectivityChanged.listen((event) {
      log("Connection status: ${event.toString()}");
      if (event[0] == ConnectivityResult.wifi ||
          event[0] == ConnectivityResult.mobile) {
        emit(state.copyWith(connectionStatus: ConnectionStatus.connected));
      } else {
        emit(state.copyWith(connectionStatus: ConnectionStatus.disconnected));
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
