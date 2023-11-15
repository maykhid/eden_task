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

  factory Order.fromMap(Map map) {
    return Order(
      id: map['id'] as String,
      item: map['item'] as String,
      price: map['price'] as String,
      quantity: map['quantity'] as int,
      status: map['status'] as int,
      date: map['date'] as DateTime,
    );
  }

  Order copyWith({
    String? id,
    String? item,
    String? price,
    DateTime? date,
    int? quantity,
    int? status,
  }) {
    return Order(
      id: id ?? this.id,
      item: item ?? this.item,
      price: price ?? this.price,
      date: date ?? this.date,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
  return {
    'id': id,
    'item': item,
    'price': price,
    'date': date?.toString(),
    'quantity': quantity,
    'status': status,
  };
}

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
