import 'package:flutter/material.dart';
import 'package:payup/core/themes/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundPrimary,
      brightness: Brightness.light,
      useMaterial3: false,
      fontFamily: 'K2D',
      primaryColor: AppColors.accentBrand,
      colorScheme: _colorScheme(),
      textTheme: _textThemeData(),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.backgroundComponents,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.borderPrimary, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.accentRed, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.accentRed, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.borderPrimary, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.accentGreen, width: 1),
        ),
        hintStyle: TextStyle(color: AppColors.textLabel, fontSize: 16, fontWeight: FontWeight.w900),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.backgroundComponents,
        selectedColor: AppColors.backgroundComponents,
        labelStyle: TextStyle(color: AppColors.textParagraph, fontSize: 16),
        secondaryLabelStyle: TextStyle(
          color: AppColors.accentBrand,
          fontSize: 16,
          fontWeight: FontWeight.w900,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: AppColors.backgroundComponents, width: 1),
        ),
      ),
      cardTheme: cardTheme,
      textButtonTheme: textTheme,
    );
  }

  static TextButtonThemeData get textTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.accentBrand,
        textStyle: TextStyle(
          color: AppColors.accentBrand,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static CardThemeData get cardTheme {
    return CardThemeData(
      color: AppColors.backgroundComponents,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      elevation: 0,
      margin: const EdgeInsets.all(8),
    );
  }

  static ColorScheme _colorScheme() {
    return const ColorScheme.light(
      primary: AppColors.accentBrand,
      secondary: AppColors.accentBrandDark,
    );
  }

  static TextTheme _textThemeData() {
    return TextTheme(
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
      labelMedium: TextStyle(color: AppColors.textLabel, fontSize: 16, fontWeight: FontWeight.w900),
      headlineSmall: TextStyle(
        color: AppColors.textHeading,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
