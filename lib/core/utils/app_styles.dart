import 'package:flutter/widgets.dart';
import 'package:travel_trek/core/utils/app_colors.dart';

abstract class AppStyles {
  // ── Original styles (unchanged) ──────────────────────────────────────────
  static const semiBold40 = TextStyle(fontSize: 40, fontWeight: FontWeight.w700);
  static const semiBold16 = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static const bold24     = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const bold26     = TextStyle(fontSize: 26, fontWeight: FontWeight.bold);
  static const meduim14   = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  static const italic16   = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  static const regluar12  = TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  static const regluar16  = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static const regluar18  = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  static const regluar32  = TextStyle(fontSize: 32, fontWeight: FontWeight.w500);

  // ── Extended styles for new screens ─────────────────────────────────────
  static const headlineSm = TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textPrimary);
  static const titleMd    = TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textPrimary);
  static const bodyMd     = TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textSecondary, height: 1.5);
  static const bodySm     = TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textSecondary, height: 1.4);
  static const labelSm    = TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.textMuted, letterSpacing: 0.2);
  static const caption    = TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: AppColors.textMuted);
}
