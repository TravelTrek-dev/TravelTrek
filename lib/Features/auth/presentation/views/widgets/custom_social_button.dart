import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  final String label;
  final String iconPath; 
final void Function() onPressed;
  const CustomSocialButton({super.key, required this.label, required this.iconPath, required this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.g_mobiledata, size: 30), 
        label: Text(label, style: const TextStyle(color: Colors.black)),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          side: const BorderSide(color: Color(0xffE0E0E0)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}