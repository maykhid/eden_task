enum AppConnectionState { connected, disconnected, unknown }

extension AppConnectionStateX on AppConnectionState {
  bool get isConnected => this == AppConnectionState.connected;
  bool get isDisconnected => this == AppConnectionState.disconnected;
  bool get unknown => this == AppConnectionState.unknown;
}
