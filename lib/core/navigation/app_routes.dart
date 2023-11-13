import 'package:eden_task/app/features/auth/ui/auth_screen.dart';
import 'package:eden_task/app/features/order/ui/views/screens/order_detail_screen.dart';
import 'package:eden_task/app/features/order/ui/views/screens/order_timeline_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static List<GoRoute> routes = [
    // List of go routes
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthScreen(),
    ),

    GoRoute(
      path: OrderTimelineScreen.name,
      builder: (context, state) => const OrderTimelineScreen(),
    ),

    GoRoute(
      path: OrderDetailScreen.name,
      builder: (context, state) => const OrderDetailScreen(),
    ),
  ];
}
