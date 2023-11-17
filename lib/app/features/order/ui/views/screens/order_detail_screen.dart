// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:eden_task/app/features/order/ui/cubit/order_bloc.dart';
import 'package:eden_task/app/features/order/ui/views/screens/order_timeline_screen.dart';
import 'package:eden_task/app/features/order/ui/views/widgets/connection_panel.dart';
import 'package:eden_task/app/features/order/ui/views/widgets/order_item.dart';
import 'package:eden_task/app/features/order/ui/views/widgets/order_tracker_tab.dart';
import 'package:eden_task/app/features/order/ui/views/widgets/user_info.dart';
import 'package:eden_task/app/shared/ui/app_images.dart';

import 'package:eden_task/core/utils/sized_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  static const String name = '/orderDetail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<OrderBloc>(
        create: (context) => OrderBloc(),
        child: const OrderDetailView(),
      ),
    );
  }
}

class OrderDetailView extends StatefulWidget {
  const OrderDetailView({
    super.key,
  });

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  @override
  Widget build(BuildContext context) {
    // final connection = ConnectionViewModel();
    return SafeArea(
      child: SingleChildScrollView(
        child: BlocListener<OrderBloc, OrderState>(
          listener: (context, state) {
            if (state.hasError) {
              toastification.show(
                context: context,
                title: state.errorMessage!,
                type: ToastificationType.error,
                autoCloseDuration: const Duration(seconds: 3),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // avatar -- user info
                    UserInfo(),

                    ConnectionPanel(),
                  ],
                ),

                const Gap(20),

                Text(
                  'Order Detail',
                  style: GoogleFonts.varelaRound(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Gap(15),

                SizedBox(
                  height: 250,
                  width: context.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //image
                        const _FoodImage(),

                        const Gap(5),

                        Container(
                          height: 2,
                          width: context.width * 0.85,
                          color: Colors.grey,
                        ),

                        const Gap(10),

                        const _TrackOrder(),
                      ],
                    ),
                  ),
                ),

                const Gap(15),

                // order tracker tab
                const OrderTrackerTab(),

                const Gap(15),

                const OrderItemInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FoodImage extends StatelessWidget {
  const _FoodImage();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(
              AppImages.food,
            ),
          ),
        ),
      ),
    );
  }
}

class _TrackOrder extends StatelessWidget {
  const _TrackOrder();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Track your order',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          child: const FaIcon(
            FontAwesomeIcons.circleArrowRight,
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute<OrderTimelineScreen>(
              builder: (ctx) => OrderTimelineScreen(
                cubit: context.read<OrderBloc>(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
