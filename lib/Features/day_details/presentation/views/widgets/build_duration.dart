import 'package:flutter/material.dart';

Widget buildDuration() {
  return Row(
    children: [
      const Icon(Icons.access_time, size: 16, color: Color(0xFFD1D1C7)),
      const SizedBox(width: 6),
      Text(
        "2h 30m duration",
        style: TextStyle(
          color: Color(0xFFD1D1C7).withValues(alpha: .8), // Muted text color
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
