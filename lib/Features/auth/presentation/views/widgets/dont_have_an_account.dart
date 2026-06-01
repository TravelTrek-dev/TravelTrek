import 'package:flutter/material.dart';
import 'package:travel_trek/Features/auth/presentation/views/sign_up_view.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("New to TravelTrek? "),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpView.routeName);
          },
          child: const Text(
            "Create Account",
            style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}