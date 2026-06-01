import 'package:flutter/material.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/active_item.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/in_active_item.dart';
import 'package:travel_trek/core/entities/bottom_navigation_bar_entity.dart';

class NaivgationBarItem extends StatelessWidget {
  const NaivgationBarItem({
    super.key,
    required this.isSelected,
    required this.entity,
  });

  final bool isSelected;
  final BottomNavigationBarEntity entity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(image: entity.activeImage, text: entity.text)
        : InActiveItem(image: entity.inActiveImage, text: entity.text,);
  }
}
