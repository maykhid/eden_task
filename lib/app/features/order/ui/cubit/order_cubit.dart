import 'package:eden_task/app/features/order/data/model/order.dart';
import 'package:eden_task/app/features/order/data/order_repository.dart';
import 'package:eden_task/core/di/di.dart';
import 'package:eden_task/core/utils/data_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit({
    OrderRepository? orderRepository,
  })  : _orderRepository = orderRepository ?? locator<OrderRepository>(),
        super(const OrderState.unknown()) {
    // _orderRepository.orderStream.listen(
    //   (order) {
    //     emit(OrderState.processing(order: order));
    //   },
    //   onError: (e) => emit(OrderState.failed(message: e.toString())),
    //   onDone: () => emit(const OrderState.done()),
    // );
  }

  final OrderRepository _orderRepository;

  Stream<Order> get orderStream => _orderRepository.orderStream;
}
