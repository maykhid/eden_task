import 'dart:convert';

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
  Stream<order.Order> get orderStream {
    return _realtimeChannel.subscribe().map((message) {
      // construct order from extra's map
      final map = message.extras!.map!['headers'] as Map
        ..addAll({'id': message.id, 'date': message.timestamp});

      return order.Order.fromMap(
        map,
      );
    });
  }
}
