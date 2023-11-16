// ignore_for_file: one_member_abstracts

import 'package:eden_task/app/features/order/data/model/order.dart';
import 'package:eden_task/core/utils/connection_state.dart';

abstract class OrderDataSourceInterface {
  /// perform any prior initializing. can ignore if not neccessary
  void initialize();

  Stream<AppConnectionState> get connectionState;

  /// A [Stream] of Order to subscribe to
  Stream<Order> get orderStream;
}
