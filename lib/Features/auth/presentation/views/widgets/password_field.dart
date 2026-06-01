import 'package:flutter/material.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});
  final dynamic Function(String?)? onSaved;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var isObscure = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onSaved: widget.onSaved,
      hintText: 'Password',
      prefixIcon: Icons.lock_outline,
      obscureText: isObscure,
      suffixIcon: isObscure
          ? IconButton(
              onPressed: () {
                isObscure = !isObscure;
                setState(() {});
              },
              icon: Icon(Icons.visibility),
            )
          : IconButton(
              onPressed: () {
                isObscure = !isObscure;
                setState(() {});
              },
              icon: Icon(Icons.visibility_off),
            ),
    );
  }
}
