import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.action});
  final String title;
  final String? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        action == null
            ? const SizedBox()
            : Text(
                action!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF66595B),
                  fontWeight: FontWeight.w500,
                ),
              ),
      ],
    );
  }
}
