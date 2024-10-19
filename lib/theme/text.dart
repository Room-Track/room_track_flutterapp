import 'package:flutter/material.dart';

class TextThemes {
  static const _medium = TextTheme(
    /**
     * Display
     */
    displayLarge: TextStyle(
      fontSize: 57.0,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontSize: 45.0,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.w400,
    ),
    /**
     * Headline
     */
    headlineLarge: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
    ),
    /**
     * Title
     */
    titleLarge: TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    /**
     * Body
     */
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
    /**
     * Label
     */
    labelLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
    ),
  );

  static TextTheme getScheme(String schemeName) {
    switch (schemeName) {
      case "Medium":
        return _medium;
      default:
        return _medium;
    }
  }
}
