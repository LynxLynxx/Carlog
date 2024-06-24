part of 'network_connection_cubit.dart';

enum ConnectionStatus {
  connected,
  disconnected,
}

@freezed
class NetworkConnectionState with _$NetworkConnectionState {
  const factory NetworkConnectionState(
      {@Default(ConnectionStatus.connected)
      ConnectionStatus connectionStatus}) = _NetworkConnectionState;
}
