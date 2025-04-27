// lib/core/theme/text_styles.dart

import 'package:flutter/material.dart';
import 'color_palette.dart';

/// Text styles for the OTT app
/// Following Material Design guidelines with customization for the streaming context
class AppTextStyles {
  // The default font family
  static const String _fontFamily = 'Roboto';

  // Display styles - for very large text like splash screens, feature titles
  static const TextStyle displayLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 57.0,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.25,
    height: 1.12,
    color: ColorPalette.textPrimaryColor,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 45.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
    height: 1.16,
    color: ColorPalette.textPrimaryColor,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 36.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
    height: 1.22,
    color: ColorPalette.textPrimaryColor,
  );

  // Headline styles - for feature headings, section titles
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.25,
    color: ColorPalette.textPrimaryColor,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.29,
    color: ColorPalette.textPrimaryColor,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.33,
    color: ColorPalette.textPrimaryColor,
  );

  // Title styles - for movie titles, episode titles
  static const TextStyle titleLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.27,
    color: ColorPalette.textPrimaryColor,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.5,
    color: ColorPalette.textPrimaryColor,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    color: ColorPalette.textPrimaryColor,
  );

  // Body styles - for descriptions, information text
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.5,
    color: ColorPalette.textPrimaryColor,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
    color: ColorPalette.textSecondaryColor,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
    color: ColorPalette.textSecondaryColor,
  );

  // Label styles - for buttons, chips, badges
  static const TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    color: ColorPalette.textPrimaryColor,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
    color: ColorPalette.textPrimaryColor,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
    color: ColorPalette.textSecondaryColor,
  );

  // Special text styles for OTT app
  static const TextStyle movieTitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.33,
    color: ColorPalette.textPrimaryColor,
  );

  static const TextStyle movieInfo = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.38,
    color: ColorPalette.textSecondaryColor,
  );

  static const TextStyle categoryLabel = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.5,
    color: ColorPalette.textPrimaryColor,
  );

  static const TextStyle buttonText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    color: ColorPalette.textButtonColor,
  );
}