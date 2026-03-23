import 'package:flutter/material.dart';
import 'package:payup/core/themes/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: false,
      fontFamily: 'K2D',
      primaryColor: AppColors.accentBrand,
      colorScheme: const ColorScheme.light(
        primary: AppColors.accentBrand,
        secondary: AppColors.accentBrandDark,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: AppColors.textHeading,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: AppColors.textHeading,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          color: AppColors.textHeading,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(color: AppColors.textParagraph, fontSize: 20),
        bodyMedium: TextStyle(color: AppColors.textParagraph, fontSize: 16),
        bodySmall: TextStyle(color: AppColors.textParagraph, fontSize: 12),
        labelMedium: TextStyle(
          color: AppColors.textLabel,
          fontSize: 16,
          fontWeight: FontWeight.w900,
        ),
        headlineSmall: TextStyle(
          color: AppColors.textHeading,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
