// lib/core/theme/app_theme.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'color_palette.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: ColorPalette.primaryColor,
      scaffoldBackgroundColor: ColorPalette.backgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: ColorPalette.primaryColor,
        secondary: ColorPalette.accentColor,
        surface: ColorPalette.surfaceColor,
        background: ColorPalette.backgroundColor,
        error: ColorPalette.errorColor,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: ColorPalette.surfaceColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(color: ColorPalette.iconColor),
        titleTextStyle: TextStyle(
          color: ColorPalette.textPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        displaySmall: AppTextStyles.displaySmall,
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineSmall: AppTextStyles.headlineSmall,
        titleLarge: AppTextStyles.titleLarge,
        titleMedium: AppTextStyles.titleMedium,
        titleSmall: AppTextStyles.titleSmall,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.labelLarge,
        labelMedium: AppTextStyles.labelMedium,
        labelSmall: AppTextStyles.labelSmall,
      ),
      cardTheme: CardTheme(
        color: ColorPalette.surfaceColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorPalette.surfaceColor,
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.unselectedItemColor,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPalette.primaryColor,
          foregroundColor: ColorPalette.textButtonColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorPalette.primaryColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorPalette.inputFillColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorPalette.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorPalette.errorColor),
        ),
        hintStyle: const TextStyle(color: ColorPalette.textSecondaryColor),
      ),
      dividerTheme: const DividerThemeData(
        color: ColorPalette.dividerColor,
        thickness: 1,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: ColorPalette.primaryColor,
        inactiveTrackColor: ColorPalette.primaryColor.withOpacity(0.3),
        thumbColor: ColorPalette.primaryColor,
        overlayColor: ColorPalette.primaryColor.withOpacity(0.2),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: ColorPalette.surfaceColor,
        contentTextStyle: const TextStyle(color: ColorPalette.textPrimaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static ThemeData get lightTheme {
    // For now, we'll just use the dark theme since OTT apps typically
    // use dark themes. If needed, we can implement a light theme later.
    return darkTheme;
  }
}