import 'package:ably_flutter/ably_flutter.dart';
import 'package:eden_task/app/features/order/data/model/order.dart' as order;
import 'package:eden_task/app/features/order/data/order_interface.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: OrderDataSourceInterface)
class AblyOrderDataSource extends OrderDataSourceInterface {
  AblyOrderDataSource({
    required RealtimeChannel realtimeChannel,
  }) : _realtimeChannel = realtimeChannel;

  final RealtimeChannel _realtimeChannel;

  @override
  void initialize() => _realtimeChannel.attach();

  // dynamic get i => _realtimeChannel.on();
  @override
  Stream<order.Order> get orderStream => _realtimeChannel
      .subscribe()
      .map((message) => order.Order(id: message.id ?? ''));
}
