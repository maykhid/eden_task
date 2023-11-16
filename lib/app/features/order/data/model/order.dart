import 'package:equatable/equatable.dart';

class Order extends Equatable {
  const Order({
    required this.orderId,
    this.orderStatus,
    this.orderDate,
  });

  factory Order.fromMap(Map map) {
    return Order(
      orderId: map['id'] as String,
      orderStatus: map['status'] as String,
      orderDate: map['date'] as DateTime,
    );
  }

  Order copyWith({
    String? orderId,
    String? orderStatus,
    String? orderMessage,
    DateTime? orderDate,
    int? quantity,
    int? status,
  }) {
    return Order(
      orderId: orderId ?? this.orderId,
      orderStatus: orderStatus ?? this.orderStatus,
      orderDate: orderDate ?? this.orderDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': orderId,
      'status': orderStatus,
      'date': orderDate?.toString(),
    };
  }

  final String orderId;
  final String? orderStatus;

  final DateTime? orderDate;

  /// Empty user which represents an unauthenticated user.
  static const empty = Order(orderId: '');

  /// Convenience getter to determine whether the current order is empty.
  bool get isEmpty => this == Order.empty;

  /// Convenience getter to determine whether the current order is not empty.
  bool get isNotEmpty => this != Order.empty;

  @override
  List<Object?> get props => [orderId, orderStatus, orderDate];
}
