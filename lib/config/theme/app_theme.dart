import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

/// Default Application Theme
class AppTheme {
  AppTheme._();

  /// Light Theme
  static ThemeData lightTheme = FlexThemeData.light(
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  /// Dark Theme
  static ThemeData darkTheme = FlexThemeData.dark(
    fontFamily: GoogleFonts.poppins().fontFamily,
    // visualDensity: FlexColorScheme.comfortablePlatformDensity,
    // swapLegacyOnMaterial3: false,
    // useMaterial3: true,
    // subThemesData: const FlexSubThemesData(
    //   blendOnLevel: 20,
    //   useMaterial3Typography: true,
    //   useM2StyleDividerInM3: true,
    //   alignedDropdown: true,
    //   useInputDecoratorThemeInDialogs: true,
    // ),
    // dialogBackground: Colors.grey.shade900,
    // scheme: FlexScheme.blueM3,
    // surfaceTint: Colors.transparent,
    // tabBarStyle: FlexTabBarStyle.forBackground,
  );

}