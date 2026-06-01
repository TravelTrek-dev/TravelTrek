import 'package:flutter/material.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.text});
  final String image, text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        Text(
          text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Color(0xff847577),
          ),
        ),
      ],
    );
  }
}
