import 'package:flutter/material.dart';

class AuthColors {
  static const Color gradientStart   = Color(0xFFFF6B00);
  static const Color gradientMid     = Color(0xFFFF3D00);
  static const Color gradientEnd     = Color(0xFFE8001C);
  static const Color cardBackground  = Color(0xFFFFF8F0);
  static const Color headingText     = Color(0xFF1A1A1A);
  static const Color labelText       = Color(0xFF333333);
  static const Color placeholderText = Color(0xFFAAAAAA);
  static const Color subtitleText    = Color(0xFF888888);
  static const Color accent          = Color(0xFFFF6B00);
  static const Color inputBorder     = Color(0xFFE0E0E0);
  static const Color socialBorder    = Color(0xFFEEEEEE);
  static const Color inactive        = Color(0xFFF5ECD7);
}

class CravelyGradients {

  static const LinearGradient primaryButton = LinearGradient(
    colors: [
      AuthColors.gradientStart, 
    AuthColors.gradientEnd
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient background = LinearGradient(
    colors: [
      AuthColors.gradientStart, 
      AuthColors.gradientMid, 
      AuthColors.gradientEnd
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

}

class CravelyAuthTheme {

  static ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: AuthColors.gradientStart,
    fontFamily: 'Poppins',
    colorScheme: const ColorScheme.light(
      primary:   AuthColors.gradientStart,
      secondary: AuthColors.gradientEnd,
      surface:   AuthColors.cardBackground,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: AuthColors.placeholderText, fontSize: 14),
      border:        OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AuthColors.inputBorder)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AuthColors.inputBorder)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AuthColors.gradientStart, width: 1.5)),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),

    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: AuthColors.headingText, fontWeight: FontWeight.bold, fontSize: 24),
      bodySmall:      TextStyle(color: AuthColors.subtitleText, fontSize: 12),
      labelLarge:     TextStyle(color: AuthColors.labelText, fontSize: 14, fontWeight: FontWeight.w500),
    ),
  );

}