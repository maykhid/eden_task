

import 'package:eden_task/core/utils/sized_context.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderItemInfo extends StatelessWidget {
  const OrderItemInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Order',
              style: GoogleFonts.varelaRound(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(10),
            Container(
              height: 1.5,
              width: context.width * 0.85,
              color: Colors.grey.shade300,
            ),
            const Gap(10),
            const OrderItemStat(
              orderItemStatTitle: 'Order',
              orderItemStatValue: 'Apple',
            ),
            const Gap(10),
            const OrderItemStat(
              orderItemStatTitle: 'Order Date',
              orderItemStatValue: '23 Nov 2012',
            ),
            const Gap(10),
            const OrderItemStat(
              orderItemStatTitle: 'Order ID',
              orderItemStatValue: '#3456543',
            ),
            const Gap(10),
            const OrderItemStat(
              orderItemStatTitle: 'Order Quantity',
              orderItemStatValue: 'x3',
            ),
          ],
        ),
      ),
    );
  }
}


class OrderItemStat extends StatelessWidget {
  const OrderItemStat({
    required this.orderItemStatTitle,
    required this.orderItemStatValue,
    super.key,
  });

  final String orderItemStatTitle;
  final String orderItemStatValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          orderItemStatTitle,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          orderItemStatValue,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
