import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddAmountField extends StatefulWidget {
  const AddAmountField({super.key, required this.onChanged});
  final Function(String)? onChanged;
  @override
  State<AddAmountField> createState() => _AddAmountFieldState();
}

class _AddAmountFieldState extends State<AddAmountField> {
  late double price;
  @override
  void initState() {
    price = 0.00;
    _controller = TextEditingController(text: price.toStringAsFixed(2));
    super.initState();
  }

  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    const Color labelColor = Color(0xFF5D5451);
    const Color valueColor = Color(0xFFD2C5C5);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'AMOUNT',
          style: TextStyle(
            color: labelColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            const Text(
              '\$',
              style: TextStyle(
                color: labelColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            IntrinsicWidth(
              child: TextField(
                onChanged: widget.onChanged,
                showCursor: true,
                cursorHeight: 50,
                controller: _controller,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: valueColor,
                  fontSize: 64,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -1,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
                cursorColor: labelColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
