
import 'package:intl/intl.dart';

String constructStatus(String status) {
  switch (status) {
    case 'ORDER PLACED':
      return 'Order placed';
    case 'ORDER ACCEPTED':
      return 'Order accepted';
    case 'ORDER PICK UP IN PROGRESS':
      return 'Order pick up in progress';
    case 'ORDER ON THE WAY TO CUSTOMER':
      return 'Order on the way';
    case 'ORDER ARRIVED':
      return 'Order arrived';
    case 'ORDER DELIVERED':
      return 'Order delivered';
    default:
      return 'Order status unknown';
  }
}

String constructDesc(String status) {
  switch (status) {
    case 'ORDER PLACED':
      return 'Waiting for the vendor to accept your order.';
    case 'ORDER ACCEPTED':
      return 'The vendor is preparing our order and & rider will pick up soon';
    case 'ORDER PICK UP IN PROGRESS':
      return 'A rider is on the way to the vendor to pick up your order';
    case 'ORDER ON THE WAY TO CUSTOMER':
      return 'A rider has picked up your order and is bringing it your way.';
    case 'ORDER ARRIVED':
      return "Don't keep the rider walting";
    case 'ORDER DELIVERED':
      return 'Enjoy!';
    default:
      return 'Unfortunately we can tell your order status';
  }
}

String formatToTime(DateTime dateTime) {
  return DateFormat('h:mm a').format(dateTime);
}
