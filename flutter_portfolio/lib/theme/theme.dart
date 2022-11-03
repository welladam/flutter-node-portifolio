import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_portfolio/theme/color.dart';

ThemeData theme = ThemeData.light();

// const ColorScheme _customColorScheme = ColorScheme(
//   primary: primaryColor,
//   secondary: Colors.amber,
//   surface: Colors.purpleAccent,
//   background: backgroundColor,
//   error: Colors.red,
//   onPrimary: Colors.red,
//   onSecondary: Colors.deepOrange,
//   onSurface: Colors.red,
//   onBackground: Colors.red,
//   onError: Colors.redAccent,
//   brightness: Brightness.light,
// );

ThemeData appTheme() {
  return theme.copyWith(
      primaryColor: primaryColorMaterial,
      backgroundColor: backgroundColor,
      shadowColor: shadowLight,
      hintColor: hintTextColor,
      // colorScheme: _customColorScheme,
      textTheme: buildTextTheme(theme.textTheme));
}

TextTheme buildTextTheme(TextTheme base) => base.copyWith(
      headlineLarge: GoogleFonts.montserrat(
          fontSize: 24, fontWeight: FontWeight.w600, color: textColor),
      headlineMedium: GoogleFonts.montserrat(
          fontSize: 18, fontWeight: FontWeight.w600, color: textColor),
      headlineSmall: GoogleFonts.montserrat(
          fontSize: 14, fontWeight: FontWeight.w600, color: primaryColor),
      titleMedium: GoogleFonts.montserrat(
          fontSize: 18, fontWeight: FontWeight.w500, color: subtitleTextColor),
      labelMedium: GoogleFonts.montserrat(
          fontSize: 16, fontWeight: FontWeight.w600, color: buttonTextColor),
      labelSmall: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: labelSmallTextColor,
          letterSpacing: 0),
      bodyMedium: GoogleFonts.montserrat(
          fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
    );
