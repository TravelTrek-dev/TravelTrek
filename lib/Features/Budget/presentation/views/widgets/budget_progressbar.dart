import 'package:flutter/material.dart';

class BudgetProgressBar extends StatelessWidget {
  final double progress;

  const BudgetProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final filledWidth = totalWidth * progress;

        return Container(
          height: 8,
          width: totalWidth,
          decoration: BoxDecoration(
            color: const Color(0xFFEDE8DF),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOutCubic,
              width: filledWidth,
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFF4A4035),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        );
      },
    );
  }
}

