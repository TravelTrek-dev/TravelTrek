import 'package:flutter/material.dart';
import 'package:travel_trek/core/utils/app_colors.dart';
import 'package:travel_trek/core/utils/app_styles.dart';

class BuildSearchBarWidget extends StatelessWidget {
  const BuildSearchBarWidget({super.key, this.onChanged});

  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppStyles.bodyMd,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search itineraries...',
        hintStyle: AppStyles.caption.copyWith(fontSize: 14),
        prefixIcon: const Icon(
          Icons.search_rounded,
          size: 20,
          color: AppColors.textMuted,
        ),
        suffixIcon: const Icon(
          Icons.tune_rounded,
          size: 18,
          color: AppColors.textSecondary,
        ),
        filled: true,
        fillColor: AppColors.surface,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(color: AppColors.primaryColor, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
