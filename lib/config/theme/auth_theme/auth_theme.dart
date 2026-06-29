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
  static const Color white           = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF0EFED);
}

class CravelyGradients {
  static const LinearGradient primaryButton = LinearGradient(
    colors: [AuthColors.gradientStart, AuthColors.gradientEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient background = LinearGradient(
    colors: [AuthColors.gradientStart, AuthColors.gradientMid, AuthColors.gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class CravelyAuthTheme {
  static ThemeData get theme => ThemeData(
    
    //  white background, not orange
    scaffoldBackgroundColor: AuthColors.background,
    fontFamily: 'Poppins',

    colorScheme: const ColorScheme.light(
      primary:   AuthColors.gradientStart,
      secondary: AuthColors.gradientEnd,
      surface:   AuthColors.cardBackground,
      onSurface: AuthColors.headingText,
    ),

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AuthColors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: AuthColors.headingText),
      titleTextStyle: TextStyle(
        color: AuthColors.headingText,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    ),

    // Input fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AuthColors.white,
      hintStyle: const TextStyle(
        color: AuthColors.placeholderText,
        fontSize: 12,
        fontFamily: 'Poppins',
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AuthColors.inputBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AuthColors.inputBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AuthColors.gradientStart, width: 1.5),
      ),
    ),

    // Elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),

    // Outlined button (social buttons)
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        side: const BorderSide(color: AuthColors.socialBorder),
        backgroundColor: AuthColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),

    // Text styles
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: AuthColors.headingText,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        fontFamily: 'Poppins',
      ),
      bodySmall: TextStyle(
        color: AuthColors.subtitleText,
        fontSize: 12,
        fontFamily: 'Poppins',
      ),
      labelLarge: TextStyle(
        color: AuthColors.labelText,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
      ),
    ),
  );
}