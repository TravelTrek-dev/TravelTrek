import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/build_detail_chip.dart';

class ItineraryCardInfo extends StatelessWidget {
  const ItineraryCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 118,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEE6),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              buildDetailChip(Icons.money, 'Moderate Budget'),
              SizedBox(height: 16),
              Row(
                children: [
                  buildDetailChip(Icons.people, '4 Travelers'),
                  SizedBox(width: 12),
                  buildDetailChip(Icons.date_range, 'Dec 12 - Dec 16'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
