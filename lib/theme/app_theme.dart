import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF00D2FF);
  static const Color secondary = Color(0xFFFF5722);
  static const Color background = Color(0xFF0A121C);
  static const Color surface = Color(0xFF101E2E);
  static const Color card = Color(0xFF162A40);
  static const Color textPrimary = Color(0xFFF0F4F8);
  static const Color textSecondary = Color(0xFF90A4AE);

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
      ),
      cardTheme: const CardThemeData(
        color: card,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: primary.withValues(alpha: 0.25),
      ),
    );
  }
}
