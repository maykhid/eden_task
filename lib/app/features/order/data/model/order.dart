import 'package:equatable/equatable.dart';

class Order extends Equatable {
  const Order({
    required this.id,
    this.item,
    this.price,
    this.date,
    this.quantity,
    this.status,
  });

  final String id;
  final String? item;
  final String? price;
  final DateTime? date;
  final int? quantity;
  final int? status;

  /// Empty user which represents an unauthenticated user.
  static const empty = Order(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == Order.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != Order.empty;

  @override
  List<Object?> get props => [id, item, price, date];
}
