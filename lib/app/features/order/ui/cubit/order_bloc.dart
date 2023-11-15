import 'package:eden_task/app/features/order/data/model/order.dart';
import 'package:eden_task/app/features/order/data/order_repository.dart';
import 'package:eden_task/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Cubit<OrderState> {
  OrderBloc({OrderRepository? orderRepository})
      : _orderRepository = orderRepository ?? locator<OrderRepository>(),
        super(OrderState.empty()) {
    // subscribe to stream
    _orderRepository.orderStream.listen(handleOrderUpdate);
  }

  final OrderRepository _orderRepository;

  void handleOrderUpdate(Order order) {
    final currentState = state;
    final updatedOrders = [...currentState.orders, order];
    emit(OrderState(orders: updatedOrders));
  }

  @override
  Future<void> close() {
    // Cancel any subscriptions or resources
    return super.close();
  }
}

class OrderState {
  OrderState({required this.orders});

  factory OrderState.empty() => OrderState(orders: []);
  final List<Order> orders;
}
