import 'package:eden_task/app/features/order/data/order_repository.dart';
import 'package:eden_task/core/di/di.dart';
import 'package:eden_task/core/utils/connection_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionCubit extends Cubit<ConnectionState> {
  ConnectionCubit({OrderRepository? orderRepository})
      : _orderRepository = orderRepository ?? locator<OrderRepository>(),
        super(ConnectionState.empty()) {
    _orderRepository.connectionState.listen(updateConnectionState);
  }

  final OrderRepository _orderRepository;

  void updateConnectionState(AppConnectionState connectionState) =>
      emit(ConnectionState(connectionState: connectionState));

  @override
  Future<void> close() {
    // Cancel any subscriptions or resources
    return super.close();
  }
}

class ConnectionState {
  ConnectionState({required this.connectionState});

  factory ConnectionState.empty() =>
      ConnectionState(connectionState: AppConnectionState.unknown);
  final AppConnectionState connectionState;
}
