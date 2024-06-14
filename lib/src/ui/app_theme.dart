import 'package:flutter/material.dart';

sealed class AppTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      scrolledUnderElevation: 0,
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF1f1350),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      floatingLabelBehavior: FloatingLabelBehavior.never,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFF1f1350),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(
          color: Color(0xFF1f1350),
        ),
        textStyle: const TextStyle(
          color: Color(0xFF1f1350),
          fontWeight: FontWeight.w700,
        ),
        disabledBackgroundColor: Colors.white,
      ),
    ),
  );
}
