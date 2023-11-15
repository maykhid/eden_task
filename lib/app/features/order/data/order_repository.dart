import 'package:eden_task/app/features/order/data/model/order.dart' as order;
import 'package:eden_task/app/features/order/data/order_interface.dart';
import 'package:injectable/injectable.dart';

@singleton
class OrderRepository {
  OrderRepository({
    required OrderDataSourceInterface orderDataSourceInterface,
  }) : _orderDataSourceInterface = orderDataSourceInterface {
    _orderDataSourceInterface.initialize();
  }

  final OrderDataSourceInterface _orderDataSourceInterface;

  Stream<order.Order> get orderStream => _orderDataSourceInterface.orderStream;
}
