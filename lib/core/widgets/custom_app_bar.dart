import 'package:flutter/material.dart';
import 'package:travel_trek/core/widgets/app_logo.dart';

AppBar customAppBar({required String name}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.explore_outlined, size: 28, color: Color(0xff847577)),
          SizedBox(width: 28 * 0.28),
          Text(
            'TravelTrek',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff847577),
              letterSpacing: 0.3,
            ),
          ),
          Spacer(),
          AppLogo(name: name),
        ],
      ),
    ),
  );
}
