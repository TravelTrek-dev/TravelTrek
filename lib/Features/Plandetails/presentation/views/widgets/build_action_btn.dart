import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/action_btn.dart';

class BuildActionBtn extends StatelessWidget {
  const BuildActionBtn({super.key, required this.onDelete});

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF5F0E8),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: ActionBtn(
        icon: Icons.delete_outline_rounded,
        label: 'Delete',
        color: const Color(0xFFB00020),
        onTap: onDelete,
      ),
    );
  }
}
