import 'package:flutter/material.dart';

class RecentPlanItem extends StatelessWidget {
  const RecentPlanItem({super.key, required this.text});
  
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.history, color: Color(0xFFD2C9CA), size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xFF2D2A2A),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}