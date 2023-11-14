import 'package:flutter/material.dart';

class OrderTimelineCard extends StatelessWidget {
  const OrderTimelineCard({
    required this.timelineStatus,
    required this.timelineDesc,
    required this.timelineTimestamp,
    super.key,
  });

  final String timelineStatus;
  final String timelineDesc;
  final String timelineTimestamp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timelineStatus,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(timelineTimestamp),
              ],
            ),
            Text(
              timelineDesc,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
