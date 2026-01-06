import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// AppTheme définit la configuration visuelle de l'application.
///
/// La palette de couleurs se base sur un ton principal rose et une
/// typographie Montserrat chargée via Google Fonts. La barre
/// d'application utilise un fond blanc et une couleur de texte sombre.
class AppTheme {
  /// Retourne le thème appliqué à l'application.
  ///
  /// Le thème est basé sur une palette verdoyante et chaleureuse
  /// rappelant la forêt tropicale, avec des touches dorées pour
  /// l'élégance. La typographie utilise Montserrat via Google Fonts.
  static ThemeData get theme {
    final base = ThemeData.light();
    // Couleur principale (vert forêt) pour la palette de semences.
    const seed = Color(0xFF3A5D38);
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seed,
        brightness: Brightness.light,
      ),
      // Palette générale : vert forêt comme couleur primaire et un fond clair verdâtre.
      primaryColor: seed,
      scaffoldBackgroundColor: const Color(0xFFF3F7F3),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: seed,
        foregroundColor: Colors.white,
      ),
      textTheme: GoogleFonts.montserratTextTheme(base.textTheme).apply(
        bodyColor: Colors.black87,
        displayColor: Colors.black87,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: seed,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: seed,
        foregroundColor: Colors.white,
      ),
      // Définition d'un thème de carte par défaut pour harmoniser les marges,
      // le rayon de bordure et l'ombre portée sur toutes les pages. Cela
      // contribue à donner un aspect soigné et cohérent aux différentes
      // sections du site.
      // Utilise la version orientée données du CardTheme afin d'éviter des
      // erreurs avec les dernières versions de Material 3. Cette définition
      // harmonise les marges, la couleur, l'élévation et le rayon des
      // bordures sur toutes les cartes du site.
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      cardColor: Colors.white,
      dividerColor: Colors.grey.shade300,
    );
  }
}