import 'package:flutter/material.dart';

class TopTag extends StatelessWidget {
  const TopTag({
    super.key,
    required this.text,
    required this.decorationColor,
    required this.textColor,
  });
  final String text;
  final Color decorationColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: decorationColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
