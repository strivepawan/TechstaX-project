import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF1E1E1E);
  static const Color surface = Color(0xFF263238);
  static const Color inputBg = Color(0xFF455A64);
  static const Color primary = Color(0xFFF5C86A);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFF9FB3C8);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: background,

    colorScheme: const ColorScheme.dark(primary: primary, surface: surface),

    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(color: textPrimary, fontSize: 18, fontWeight: FontWeight.w600),
      iconTheme: IconThemeData(color: textPrimary),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: textPrimary),
      headlineMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: textPrimary),
      bodyLarge: TextStyle(fontSize: 16, color: textPrimary),
      bodyMedium: TextStyle(fontSize: 14, color: textSecondary),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: Colors.black,
    ),

    // Input Fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: inputBg,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      hintStyle: const TextStyle(color: Colors.white70),
      labelStyle: const TextStyle(color: textSecondary),
      prefixIconColor: textSecondary,
      suffixIconColor: textSecondary,
    ),

    // Divider
    dividerTheme: const DividerThemeData(color: Color(0xFF4A5A64), thickness: 1),
  );
}
