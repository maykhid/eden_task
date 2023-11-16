import 'package:ably_flutter/ably_flutter.dart';
import 'package:eden_task/app/features/order/data/model/order.dart' as order;
import 'package:eden_task/app/features/order/data/order_interface.dart';
import 'package:eden_task/core/utils/connection_state.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: OrderDataSourceInterface)
class AblyOrderDataSource extends OrderDataSourceInterface {
  AblyOrderDataSource({
    required RealtimeChannel realtimeChannel,
  }) : _realtimeChannel = realtimeChannel;

  final RealtimeChannel _realtimeChannel;

  @override
  void initialize() => _realtimeChannel.attach();

  @override
  Stream<order.Order> get orderStream => _realtimeChannel.subscribe().map(
        (message) => order.Order.fromMap(
          {
            'id': message.id,
            'date': message.timestamp,
            'status': message.data,
          },
        ),
      );

  @override
  Stream<AppConnectionState> get connectionState =>
      _realtimeChannel.on().map((stateChange) {
        /// ideally checking ConnectionStateChange would be the way
        /// to check if we are connected to Ably but somehow I am unable to
        /// recieve real-time update of the ConnectionStateChange's
        /// (could be a bug).
        /// However, since a successful connect to a Channel occurs,
        /// it's safe to say we're connected to Ably too.
        if (stateChange.current == ChannelState.attached) {
          return AppConnectionState.connected;
        }
        return AppConnectionState.disconnected;
      });
}
