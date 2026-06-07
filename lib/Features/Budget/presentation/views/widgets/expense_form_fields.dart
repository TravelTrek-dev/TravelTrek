import 'package:flutter/material.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({super.key, required this.onChangedDescriptionField});
  final Function(String)? onChangedDescriptionField;

  @override
  Widget build(BuildContext context) {
    const Color labelColor = Color(0xFF5D5451);
    const Color fieldFillColor = Color(0xFFEBEBE3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Expense Description',
          style: TextStyle(
            color: labelColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          onChanged: onChangedDescriptionField,
          decoration: InputDecoration(
            hintText: 'Dinner at Le Marais',
            hintStyle: const TextStyle(color: Colors.black26),
            filled: true,
            fillColor: fieldFillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
