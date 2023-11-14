import 'package:flutter/material.dart';

class OrderTrackerTab extends StatelessWidget {
  const OrderTrackerTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
