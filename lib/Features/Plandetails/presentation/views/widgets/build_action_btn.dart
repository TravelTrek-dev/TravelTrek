import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/action_btn.dart';
import 'package:travel_trek/core/utils/app_colors.dart';

class BuildActionBtn extends StatefulWidget {
  const BuildActionBtn({super.key,});
  
  @override
  State<BuildActionBtn> createState() => _BuildActionBtnState();
}

class _BuildActionBtnState extends State<BuildActionBtn> {
  bool showActionBtn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF5F0E8),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: Row(
        children: [
          ActionBtn(
            icon: Icons.copy_outlined,
            label: 'Copy',
            onTap: () =>   showActionBtn = false,
          ),
          Container(width: 1, height: 40, color: AppColors.border),
          ActionBtn(
            icon: Icons.delete_outline_rounded,
            label: 'Delete',
            color: const Color(0xFFB00020),
            onTap: () => showActionBtn = false,
          ),
        ],
      ),
    );
    
  }
}
