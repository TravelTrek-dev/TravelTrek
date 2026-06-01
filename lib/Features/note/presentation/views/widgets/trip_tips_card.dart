import 'package:flutter/material.dart';

class TripTipsCard extends StatelessWidget {
  const TripTipsCard({super.key});

  @override
  Widget build(BuildContext context) {
    const Color cardBackground = Color(0xFFEBEBE3);
    const Color headerColor = Color(0xFF5D5451);
    const Color bodyTextColor = Color(0xFF7A706D);

    return Container(
      width: double.infinity, 
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trip Tips',
            style: TextStyle(
              color: headerColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          // Body Text
          Text(
            'Pack light, stay hydrated, and always carry a power bank. Don’t forget to check the local weather and download offline maps for your destination.',
            style: TextStyle(
              color: bodyTextColor,
              fontSize: 15,
              height: 1.6, 
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}