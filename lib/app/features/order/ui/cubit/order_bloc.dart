import 'package:eden_task/app/features/order/data/model/order.dart';
import 'package:eden_task/app/features/order/data/order_repository.dart';
import 'package:eden_task/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Cubit<OrderState> {
  OrderBloc({OrderRepository? orderRepository})
      : _orderRepository = orderRepository ?? locator<OrderRepository>(),
        super(OrderState.empty()) {
    // subscribe to stream
    _orderRepository.orderStream.listen(updateOrder).onError(
          (_) => updateError(
            '''Error: Payload validation failed. Check for issues with data types, missing fields, or incorrect values in your payload.''',
          ),
        );
  }

  final OrderRepository _orderRepository;

  void updateOrder(Order order) {
    final currentState = state;
    final updatedOrders = [...currentState.orders, order];
    emit(OrderState(orders: updatedOrders));
  }

  void updateError(String message) =>
      emit(OrderState.withError(message, state.orders));

  @override
  Future<void> close() {
    // Cancel any subscriptions or resources
    return super.close();
  }
}

class OrderState {
  OrderState({required this.orders, this.errorMessage});

  factory OrderState.empty() => OrderState(orders: []);
  factory OrderState.withError(String errorMessage, List<Order> orders) =>
      OrderState(orders: orders, errorMessage: errorMessage);

  bool get hasError => errorMessage != null;

  final List<Order> orders;
  final String? errorMessage;
}
