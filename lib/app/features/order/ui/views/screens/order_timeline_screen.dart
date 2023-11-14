import 'package:eden_task/app/features/order/ui/views/widgets/order_timeline_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderTimelineScreen extends StatelessWidget {
  const OrderTimelineScreen({super.key});

  static const String name = '/orderTimeline';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                child: ListView.separated(
                  itemCount: 30,
                  separatorBuilder: (context, index) {
                    return const SeparatorWidget();
                  },
                  itemBuilder: (context, index) {
                    return const OrderTimelineCard(
                      timelineStatus: 'Your order has been placed.',
                      timelineTimeStamp: '9:23 AM',
                      timelineDesc:
                          'Waiting for the vendor to accept your order. ',
                    );
                  },
                ),
              ),
            ],
          ),
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
