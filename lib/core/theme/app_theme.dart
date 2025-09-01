import 'package:flutter/material.dart';
import 'package:sportzenzehra/core/theme/app_colors.dart';
import 'package:sportzenzehra/core/theme/text_style.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surface,
      error: AppColors.error,
      onPrimary: Colors.white,
      onSecondary: AppColors.textPrimary,
      onSurface: AppColors.textPrimary,
      onError: Colors.white,
      brightness: Brightness.light,
    ),

    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headline1,
      headlineMedium: AppTextStyles.headline2,
      bodySmall: AppTextStyles.cardTitle,
      bodyMedium: AppTextStyles.bodyMedium,
      labelLarge: AppTextStyles.labelLarge,
      labelMedium: AppTextStyles.labelMedium,
    ),
  );
}
