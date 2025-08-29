// import 'package:flutter/material.dart';
//
// class AppColors {
//   static const primary = Color(0xFF00796B);
//   static const secondary = Color(0xFF004D40);
//   static const background = Color(0xFFF1F8E9);
//   static const error = Color(0xFFD32F2F);
//   static const textPrimary = Color(0xFF212121);
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Your color palette and font definitions
const Color primaryColor = Color(0xFF03A9F4);
const Color secondaryColor = Color(0xFF673AB7);
const Color backgroundColor = Color(0xFFE3F2FD);
const Color surfaceColor = Color(0xFFFFFFFF);
const Color textPrimaryColor = Color(0xFF1E2749);
const Color textSecondaryColor = Color(0xFF4B5563);

// This is the custom font family name you will define in your pubspec.yaml
const String headingFont = 'Poppins';
const String bodyFont = 'Lato';

// A custom InputDecorationTheme as defined in the previous artifact.
final InputDecorationTheme customInputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: textSecondaryColor, width: 1.5),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: primaryColor, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Colors.red, width: 2),
  ),
  hintStyle: TextStyle(
    color: textSecondaryColor.withValues(alpha:0.6),
    fontFamily: bodyFont,
  ),
  labelStyle: const TextStyle(
    color: textSecondaryColor,
    fontFamily: bodyFont,
    fontWeight: FontWeight.w500,
  ),
  filled: true,
  fillColor: surfaceColor,
  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
);

// A comprehensive ThemeData object for your entire app.
final ThemeData appTheme = ThemeData(
  // Define the overall color scheme for the app.
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    secondary: secondaryColor,
    surface: surfaceColor,
    background: backgroundColor,
    onPrimary: surfaceColor, // Text/icon color on the primary color
    onSecondary: surfaceColor, // Text/icon color on the secondary color
    onSurface: textPrimaryColor, // Text/icon color on the surface color
    onBackground: textPrimaryColor, // Text/icon color on the background
  ),

  // Define the overall brightness.
  brightness: Brightness.light,

  // Use the Lato font as the default for the entire app.
  fontFamily: bodyFont,

  // Define a complete text theme with different styles.
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: headingFont,
      fontSize: 57,
      fontWeight: FontWeight.bold,
      color: textPrimaryColor,
    ),
    displayMedium: TextStyle(
      fontFamily: headingFont,
      fontSize: 45,
      fontWeight: FontWeight.bold,
      color: textPrimaryColor,
    ),
    displaySmall: TextStyle(
      fontFamily: headingFont,
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: textPrimaryColor,
    ),
    headlineLarge: TextStyle(
      fontFamily: headingFont,
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: textPrimaryColor,
    ),
    headlineMedium: TextStyle(
      fontFamily: headingFont,
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: textPrimaryColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: headingFont,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: textPrimaryColor,
    ),
    titleLarge: TextStyle(
      fontFamily: headingFont,
      fontSize: 22,
      color: textPrimaryColor,
    ),
    titleMedium: TextStyle(
      fontFamily: bodyFont,
      fontSize: 16,
      color: textPrimaryColor,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontFamily: bodyFont,
      fontSize: 14,
      color: textPrimaryColor,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontFamily: bodyFont,
      fontSize: 16,
      color: textPrimaryColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: bodyFont,
      fontSize: 14,
      color: textSecondaryColor,
    ),
    bodySmall: TextStyle(
      fontFamily: bodyFont,
      fontSize: 12,
      color: textSecondaryColor,
    ),
    labelLarge: TextStyle(
      fontFamily: bodyFont,
      fontSize: 14,
      color: textPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      fontFamily: bodyFont,
      fontSize: 12,
      color: textPrimaryColor,
    ),
    labelSmall: TextStyle(
      fontFamily: bodyFont,
      fontSize: 11,
      color: textSecondaryColor,
    ),
  ),

  // Apply the text field theme from the previous artifact.
  inputDecorationTheme: customInputDecorationTheme,

  // Theme for all elevated buttons in the app.
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor, // Use the primary color
      foregroundColor: surfaceColor, // Text/icon color on the button
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      textStyle: const TextStyle(
        fontFamily: bodyFont,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),

  // Theme for all text buttons.
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: primaryColor,
      textStyle: const TextStyle(
        fontFamily: bodyFont,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),

  // Theme for all outlined buttons.
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: primaryColor,
      side: const BorderSide(color: primaryColor, width: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(
        fontFamily: bodyFont,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  // Theme for the AppBar.
  appBarTheme: AppBarTheme(
    backgroundColor: surfaceColor,
    foregroundColor: textPrimaryColor,
    elevation: 4,
    shadowColor: Colors.black.withValues(alpha:0.1),
    centerTitle: true,
    titleTextStyle: const TextStyle(
      fontFamily: headingFont,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: textPrimaryColor,
    ),
    systemOverlayStyle: SystemUiOverlayStyle
        .dark, // Ensures status bar icons are visible on a light background
  ),

  // Theme for all icons.
  iconTheme: const IconThemeData(
    color: textPrimaryColor,
    size: 24,
  ),

  // Customize the floating action button to use the secondary color
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: secondaryColor,
  ),
);
