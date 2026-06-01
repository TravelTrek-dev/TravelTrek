import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final Function(String?)? onSaved;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false, this.onSaved, 
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved:onSaved ,
      validator: (value){
        if (value == null || value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, color: Colors.grey),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        border: buildBorder(),
        enabledBorder: buildBorder()
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xffE0E0E0)),
      );
  }
}