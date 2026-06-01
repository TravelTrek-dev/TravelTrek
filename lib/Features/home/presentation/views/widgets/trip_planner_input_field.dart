import 'package:flutter/material.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/build_chip.dart';

class TripPlannerInputField extends StatelessWidget {
  const TripPlannerInputField({super.key, required this.controller, required this.onChanged});
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5EC),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: const Color(0xFFD2C9CA).withValues(alpha: .3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20 , left:  24 , right:  24 , bottom: 24),
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              maxLines: 6, 
              minLines: 1,
              style: const TextStyle(
                color: Color(0xFF4A4646),
                fontSize: 16,
              ),
              decoration:  InputDecoration(
                hintText: 'e.g., A 5-day family trip to Cairo\nwith kids and medium budget',
                hintStyle: TextStyle(
                  color: Color(0xFFD2C9CA).withValues(alpha: 0.8),
                  fontSize: 16,
                  height: 1.5,
                ),
                border: InputBorder.none, 
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    buildChip(Icons.location_on_outlined, 'Cairo'),
                    buildChip(Icons.calendar_today_outlined, '5 days'),
                    buildChip(Icons.people_outline, 'family'),
                    buildChip(Icons.payments_outlined, 'medium budget'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Color(0xFF847577),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.mic, color: Colors.white, size: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
