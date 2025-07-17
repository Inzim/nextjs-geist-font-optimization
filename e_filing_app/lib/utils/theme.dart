import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF2D3748);
  static const Color secondaryColor = Color(0xFF4A5568);
  static const Color accentColor = Color(0xFF3182CE);
  static const Color backgroundColor = Color(0xFF1A202C);
  static const Color surfaceColor = Color(0xFF2D3748);
  static const Color cardColor = Color(0xFF4A5568);
  static const Color textPrimaryColor = Colors.white;
  static const Color textSecondaryColor = Color(0xFFA0AEC0);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: cardColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: textPrimaryColor,
        elevation: 0,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(color: textSecondaryColor),
      ),
      dataTableTheme: DataTableThemeData(
        headingRowColor: MaterialStateProperty.all(surfaceColor),
        dataRowColor: MaterialStateProperty.all(cardColor),
        headingTextStyle: const TextStyle(
          color: textPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
        dataTextStyle: const TextStyle(color: textPrimaryColor),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: textPrimaryColor),
        headlineMedium: TextStyle(color: textPrimaryColor),
        headlineSmall: TextStyle(color: textPrimaryColor),
        bodyLarge: TextStyle(color: textPrimaryColor),
        bodyMedium: TextStyle(color: textPrimaryColor),
        bodySmall: TextStyle(color: textSecondaryColor),
      ),
    );
  }
}
