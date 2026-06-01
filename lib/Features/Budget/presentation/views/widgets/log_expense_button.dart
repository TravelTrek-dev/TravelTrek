import 'package:flutter/material.dart';

class LogExpenseButton extends StatefulWidget {
  final VoidCallback onTap;

  const LogExpenseButton({super.key, required this.onTap});

  @override
  State<LogExpenseButton> createState() => _LogExpenseButtonState();
}

class _LogExpenseButtonState extends State<LogExpenseButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFF4A4035),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.add_circle_outline_rounded,
                color: Colors.white,
                size: 22,
              ),
              SizedBox(width: 10),
              Text(
                'Log New Expense',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
