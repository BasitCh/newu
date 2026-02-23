import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color _primaryPurple = Color(0xFF630068);
  static const Color _darkBackground = Color(0xFF1C1B1F);
  static const Color _lightBackground = Color(0xFFF2F2F7);

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryPurple,
        brightness: Brightness.light,
        background: _lightBackground,
      ),
      useMaterial3: true,
      textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
      scaffoldBackgroundColor: _lightBackground,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryPurple,
        brightness: Brightness.dark,
        background: _darkBackground,
      ),
      useMaterial3: true,
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      scaffoldBackgroundColor: _darkBackground,
    );
  }
}
