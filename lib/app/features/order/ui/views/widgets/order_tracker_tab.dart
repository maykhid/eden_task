import 'package:eden_task/app/features/order/ui/cubit/order_bloc.dart';
import 'package:eden_task/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class OrderTrackerTab extends StatelessWidget {
  const OrderTrackerTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        // final order = state.orders.last;
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xffE7DAC9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.orders.isNotEmpty
                      ? constructStatus(state.orders.last.orderStatus!)
                      : 'Hungry?',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  state.orders.isNotEmpty
                      ? constructDesc(state.orders.last.orderStatus!)
                      : 'Place an order!',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const Gap(10),
                LinearPercentIndicator(
                  barRadius: const Radius.circular(4),
                  lineHeight: 4,
                  percent: state.orders.length / 6 * 1,
                  backgroundColor: Colors.green.shade200,
                  progressColor: Colors.green,
                  animation: true,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
