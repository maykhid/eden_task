part of 'order_cubit.dart';

class OrderState extends Equatable {
  const OrderState.unknown() : this._();

  const OrderState.processing({required Order order})
      : this._(
          status: DataResponseStatus.processing,
          order: order,
        );

  const OrderState.done()
      : this._(
          status: DataResponseStatus.success,
        );

  const OrderState.failed({String? message})
      : this._(message: message, status: DataResponseStatus.error);

  const OrderState._({
    this.message,
    this.status = DataResponseStatus.initial,
    this.order,
  });

  final DataResponseStatus status;
  final Order? order;
  final String? message;

  @override
  List<Object?> get props => [status, message];
}
