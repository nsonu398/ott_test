// lib/core/theme/color_palette.dart

import 'package:flutter/material.dart';

/// Color palette for the OTT app
/// Using a Netflix-inspired dark theme with vibrant accent colors
class ColorPalette {
  // Primary brand color
  static const primaryColor = Color(0xFFE50914);      // Netflix Red

  // Secondary/accent color
  static const accentColor = Color(0xFF0071EB);       // Bright Blue

  // Background colors
  static const backgroundColor = Color(0xFF141414);   // Almost Black
  static const surfaceColor = Color(0xFF1F1F1F);      // Dark Gray
  static const cardColor = Color(0xFF2B2B2B);         // Slightly Lighter Gray
  static const inputFillColor = Color(0xFF333333);    // Medium Gray

  // Text colors
  static const textPrimaryColor = Color(0xFFFFFFFF);  // White
  static const textSecondaryColor = Color(0xFFB3B3B3); // Light Gray
  static const textTertiaryColor = Color(0xFF757575); // Medium Gray
  static const textButtonColor = Color(0xFFFFFFFF);   // White

  // Success, error, warning colors
  static const successColor = Color(0xFF2ECC71);      // Green
  static const errorColor = Color(0xFFE74C3C);        // Red (different from primary)
  static const warningColor = Color(0xFFF39C12);      // Orange/Amber

  // Other UI element colors
  static const dividerColor = Color(0xFF3D3D3D);      // Border Gray
  static const unselectedItemColor = Color(0xFF8C8C8C); // Gray
  static const iconColor = Color(0xFFFFFFFF);         // White

  // Semi-transparent overlays
  static const overlayDark = Color(0x99000000);       // 60% Black
  static const overlayLight = Color(0x33FFFFFF);      // 20% White

  // Premium/special content
  static const premiumColor = Color(0xFFFFD700);      // Gold
}