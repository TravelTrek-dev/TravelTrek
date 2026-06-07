import 'package:flutter/material.dart';

Widget buildHeader() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "9:00 AM",
              style: TextStyle(
                color: Color(0xff847577),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Eiffel Tower Summit",
              style: TextStyle(
                color: Color(0xff2C2829),
                fontSize: 16,
                fontFamily: 'Georgia',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(width: 12),
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          'https://images.unsplash.com/photo-1511739001486-6bfe10ce785f?auto=format&fit=crop&w=150&q=80',
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
    ],
  );
}
