import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// AppTheme définit la configuration visuelle de l'application.
///
/// La palette de couleurs se base sur un ton principal rose et une
/// typographie Montserrat chargée via Google Fonts. La barre
/// d'application utilise un fond blanc et une couleur de texte sombre.
class AppTheme {
  static ThemeData get theme {
    final base = ThemeData.light();
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.pink,
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.montserratTextTheme(base.textTheme),
      primaryColor: Colors.pink,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
    );
  }
}