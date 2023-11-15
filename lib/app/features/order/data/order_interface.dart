// ignore_for_file: one_member_abstracts

import 'package:eden_task/app/features/order/data/model/order.dart';

abstract class OrderDataSourceInterface {
  /// perform any prior initializing. can ignore if not neccessary
  void initialize();
  Stream<Order> get orderStream;
}
