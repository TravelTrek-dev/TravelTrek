import 'package:flutter/material.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/services/prefs.dart';

class TermsAndCondtions extends StatefulWidget {
  const TermsAndCondtions({super.key});

  @override
  State<TermsAndCondtions> createState() => _TermsAndCondtionsState();
}

class _TermsAndCondtionsState extends State<TermsAndCondtions> {
  var isSlected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isSlected,
          onChanged: (value) {
            isSlected = value!;

            Prefs.setBool(kSelectedRemeberMe, isSlected);
            setState(() {});
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        const Text('Remember Me', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
