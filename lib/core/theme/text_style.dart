import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';

class AppTextStyles {
  static const bottomNaviText = TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static TextStyle headline1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle inputhintstyle = TextStyle(
    color: Colors.black.withValues(alpha: 0.7),
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static TextStyle headline2 = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static TextStyle labelLarge = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  static TextStyle labelMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyMedium = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodySmall = TextStyle(
    color: AppColors.grey.withValues(alpha: 0.8),
    fontWeight: FontWeight.w500,
    fontSize: 13,
  );

  static TextStyle cardTitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black.withValues(alpha: 0.7),
  );
  static TextStyle selectionvalue = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
