import 'package:flutter/material.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/naivgation_bar_item.dart';
import 'package:travel_trek/core/entities/bottom_navigation_bar_entity.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return Expanded(
            flex: index == selectedIndex ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.onItemTapped(selectedIndex);
                });
              },
              child: NaivgationBarItem(
                isSelected: selectedIndex == index,
                entity: entity,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
