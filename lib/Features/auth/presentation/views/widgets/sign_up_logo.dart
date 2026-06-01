import 'package:flutter/material.dart';

class SignUpLogo extends StatelessWidget {
  const SignUpLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.explore_outlined, color: Color(0xff8B7E7A), size: 30),
        const SizedBox(width: 8),
        Text(
          'TravelTrek',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
