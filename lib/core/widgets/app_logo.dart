import 'dart:io';

import 'package:flutter/material.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/services/prefs.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    final imagePath = Prefs.getString(kProfileImagePath);
    final hasImage = imagePath.isNotEmpty;

    return GestureDetector(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF6B5B4E),
        ),
        clipBehavior: Clip.antiAlias,
        child: hasImage
            ? Image.file(
                File(imagePath),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) =>
                    _Initials(name: name),
              )
            : _Initials(name: name),
      ),
    );
  }
}

class _Initials extends StatelessWidget {
  const _Initials({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : 'T',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
    );
  }
}
