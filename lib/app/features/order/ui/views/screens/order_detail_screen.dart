import 'package:eden_task/app/features/order/ui/views/screens/order_timeline_screen.dart';
import 'package:eden_task/app/features/order/ui/views/widgets/order_item.dart';
import 'package:eden_task/app/features/order/ui/views/widgets/order_tracker_tab.dart';
import 'package:eden_task/app/shared/ui/app_images.dart';
import 'package:eden_task/core/utils/sized_context.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
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
                // avatar -- user info
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

                        Row(
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
                              onTap: () =>
                                  context.push(OrderTimelineScreen.name),
                            ),
                          ],
                        ),
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