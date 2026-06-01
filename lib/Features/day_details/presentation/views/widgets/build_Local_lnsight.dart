import 'package:flutter/material.dart';

Widget buildLocalInsight() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Color(0xFFF1F1E6),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "LOCAL INSIGHT",
          style: TextStyle(
            color: Color(0xFF847577),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Book tickets online to skip the line. Best time to visit: early morning to avoid crowds.",
          style: TextStyle(
            color: Color(0xFF6B6363),
            fontStyle: FontStyle.italic,
            height: 1.4,
            fontSize: 14,
            fontFamily: 'Georgia',
          ),
        ),
      ],
    ),
  );
}
