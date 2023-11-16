import 'package:eden_task/app/features/order/ui/cubit/order_bloc.dart';
import 'package:eden_task/app/features/order/ui/views/widgets/order_timeline_card.dart';
import 'package:eden_task/app/shared/ui/fading_widget.dart';
import 'package:eden_task/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderTimelineScreen extends StatefulWidget {
  const OrderTimelineScreen({
    required this.cubit,
    super.key,
  });

  final OrderBloc cubit;

  static const String name = '/orderTimeline';

  @override
  State<OrderTimelineScreen> createState() => _OrderTimelineScreenState();
}

class _OrderTimelineScreenState extends State<OrderTimelineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<OrderBloc>.value(
        value: widget.cubit,
        // create: (context) => OrderCubit()..compoundOrder(),
        child: const OrderTimelineView(),
      ),
    );
  }
}

class OrderTimelineView extends StatelessWidget {
  const OrderTimelineView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final orders = context.read<OrderListBloc>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  child: const FaIcon(
                    FontAwesomeIcons.circleArrowLeft,
                  ),
                  onTap: () => context.pop(),
                ),
                const Gap(10),
                Text(
                  'Order Detail',
                  style: GoogleFonts.varelaRound(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Gap(15),
            Expanded(
              child: BlocConsumer<OrderBloc, OrderState>(
                bloc: context.read<OrderBloc>(),
                listener: (_, __) {},
                // buildWhen: (_, __) => orders != __.orders,
                builder: (context, state) {
                  final hasData = state.orders.isNotEmpty;

                  if (!hasData) {
                    return Center(
                      child: FadingWidget(
                        child: Text(
                          'Awaiting your order...',
                          style: GoogleFonts.varelaRound(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    itemCount: state.orders.length,
                    separatorBuilder: (context, index) {
                      return const SeparatorWidget();
                    },
                    itemBuilder: (context, index) {
                      final order = state.orders[index];
                      return OrderTimelineCard(
                        timelineStatus: constructStatus(order.orderStatus!),
                        timelineTimestamp: formatToTime(order.orderDate!),
                        timelineDesc: constructDesc(order.orderStatus!),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 12,
      ),
      child: Container(
        height: 2,
        color: const Color(0xffE7DAC9),
      ),
    );
  }
}
