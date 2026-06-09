import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key, required this.onTap});
  final ValueChanged<int> onTap;

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      isScrollable: false,
      indicatorColor: const Color(0xFF66595B),
      indicatorWeight: 3.5,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: const Color(0xFF66595B),
      unselectedLabelColor: const Color(0xFF9E9E9E),
      labelPadding: EdgeInsets.zero,
      labelStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      dividerColor: const Color(0xFFE0E0E0),
      tabs: const [
        Tab(text: 'Itinerary'),
        Tab(text: 'Budget'),
        Tab(text: 'Day Details'),
      ],
    );
  }
}
