import 'package:eden_task/app/features/auth/ui/auth_screen.dart';
import 'package:eden_task/app/features/auth/ui/cubit/authentication_cubit.dart';
import 'package:eden_task/app/features/order/ui/views/screens/order_detail_screen.dart';
import 'package:eden_task/app/features/order/ui/views/screens/order_timeline_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static List<GoRoute> routes = [
    // List of go routes
    GoRoute(
      path: '/',
      builder: (context, state) {
        final authState = context.read<AuthenticationCubit>();
        if (authState.user.isNotEmpty) {
          return const OrderDetailScreen();
        }

        return const AuthScreen();
      },
    ),

    // GoRoute(
    //   path: OrderTimelineScreen.name,
    //   builder: (context, state) => const OrderTimelineScreen(),
    // ),

    GoRoute(
      path: OrderDetailScreen.name,
      builder: (context, state) => const OrderDetailScreen(),
    ),
  ];
}
