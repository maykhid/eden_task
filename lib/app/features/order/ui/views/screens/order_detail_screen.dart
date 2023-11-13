import 'package:eden_task/app/shared/ui/app_images.dart';
import 'package:eden_task/core/utils/sized_context.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  static const String name = '/orderDetail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(),
                      Gap(5),
                      Text(
                        'Hi Henry',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
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

                // image container
                Container(
                  decoration: BoxDecoration(
                    // color: const Color(0xffE7DAC9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 250,
                  width: context.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //image
                        Expanded(
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
                        ),
                        const Gap(5),

                        Container(
                          height: 2,
                          width: context.width * 0.85,
                          color: Colors.grey,
                        ),

                        const Gap(10),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Track your order',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FaIcon(FontAwesomeIcons.circleArrowRight),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(15),

                // order tab
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffE7DAC9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your order has been placed.',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Waiting for the vendor to accept your order.',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: generatePills(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(15),

                Container(
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
                        

                        const OrderItemStat(
                          orderItemStatTitle: 'Order Quantity',
                          orderItemStatValue: 'x3',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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

List<Widget> generatePills() {
  return List.generate(
    6,
    (index) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Container(
            height: 5,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
    },
  );
}
