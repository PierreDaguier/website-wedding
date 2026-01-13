import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// AppTheme définit la configuration visuelle de l'application.
///
/// La palette de couleurs s'inspire d'un univers élégant et naturel,
/// avec un fond crème, un vert profond et des accents dorés.
class AppTheme {
  /// Retourne le thème appliqué à l'application.
  ///
  /// Le thème combine Playfair Display pour les titres et Montserrat
  /// pour le corps du texte, avec une palette off-white et forêt.
  static ThemeData get theme {
    final base = ThemeData.light();
    const primary = Color(0xFF1B3B36);
    const background = Color(0xFFF9F7F2);
    const accent = Color(0xFFD4AF37);

    final textTheme = GoogleFonts.montserratTextTheme(base.textTheme).apply(
      bodyColor: primary,
      displayColor: primary,
    );

    final serif = GoogleFonts.playfairDisplay;

    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.light,
        primary: primary,
        secondary: accent,
        background: background,
      ),
      primaryColor: primary,
      scaffoldBackgroundColor: background,
      textTheme: textTheme.copyWith(
        displayLarge: serif(textStyle: textTheme.displayLarge),
        displayMedium: serif(textStyle: textTheme.displayMedium),
        displaySmall: serif(textStyle: textTheme.displaySmall),
        headlineLarge: serif(textStyle: textTheme.headlineLarge),
        headlineMedium: serif(textStyle: textTheme.headlineMedium),
        headlineSmall: serif(textStyle: textTheme.headlineSmall),
        titleLarge: serif(textStyle: textTheme.titleLarge),
        titleMedium: serif(textStyle: textTheme.titleMedium),
        titleSmall: serif(textStyle: textTheme.titleSmall),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          textStyle: const TextStyle(
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white, width: 1.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          textStyle: const TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        margin: EdgeInsets.zero,
        shadowColor: Colors.black.withOpacity(0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      dividerColor: primary.withOpacity(0.1),
    );
  }
}
