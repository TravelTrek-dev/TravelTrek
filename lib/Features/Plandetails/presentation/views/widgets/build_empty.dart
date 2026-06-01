import 'package:flutter/material.dart';
import 'package:travel_trek/core/utils/app_colors.dart';

class BuildEmpty extends StatelessWidget {
  const BuildEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.map_outlined, size: 48, color: AppColors.textMuted),
        SizedBox(height: 12),
        Text('No plans found', style: TextStyle(color: AppColors.textMuted, fontSize: 16)),
      ]),
    );
  }
}