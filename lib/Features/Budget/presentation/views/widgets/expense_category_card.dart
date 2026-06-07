import 'package:flutter/material.dart';

class ExpenseCategoryCard extends StatelessWidget {
  const ExpenseCategoryCard({
    super.key,
    required this.category,
    required this.description,
    required this.amount,
  });
  final String category;
  final String description;
  final double amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFEFEBE2),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFC9BFB0),
          width: 1.5,

          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        children: [
          // Left: category + description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1207),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF7A6F5E),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1207),
              letterSpacing: -0.2,
            ),
          ),

          const SizedBox(width: 14),
        ],
      ),
    );
  }
}
