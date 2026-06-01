import 'package:flutter/material.dart';

Widget buildActionRow() {
  return InkWell(
    onTap: () {},
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "GET DIRECTIONS",
          style: TextStyle(
            color: Color(0xFF6B6363),
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 4),
        Icon(
          Icons.send_outlined, // Closest match to the paper plane icon
          size: 14,
          color: Color(0xFF6B6363),
        ),
      ],
    ),
  );
}
