import 'package:flutter_dotenv/flutter_dotenv.dart';

class ContactConfig {
  // --- TELEPHONES ---
  // Ces getters vont chercher les clés dans ton fichier .env
  static String get phonePierre =>
      dotenv.env['PHONE_PIERRE'] ?? 'Non disponible';
  static String get phoneJoanne =>
      dotenv.env['PHONE_JOANNE'] ?? 'Non disponible';
  static String get phoneContact =>
      dotenv.env['PHONE_CONTACT'] ?? 'Non disponible';

  // --- EMAILS ---
  static String get emailPierre =>
      dotenv.env['EMAIL_PIERRE'] ?? 'Non disponible';
  static String get emailJoanne =>
      dotenv.env['EMAIL_JOANNE'] ?? 'Non disponible';
  static String get emailContact =>
      dotenv.env['EMAIL_CONTACT'] ?? 'Non disponible';
}
