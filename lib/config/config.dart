import 'package:flutter_dotenv/flutter_dotenv.dart';

class ContactConfig {
  // On utilise des getters pour récupérer la valeur en temps réel dans le .env
  static String get phonePierre =>
      dotenv.env['PHONE_PIERRE'] ?? 'Numéro non disponible';
  static String get phoneJoanne => dotenv.env['PHONE_JOANNE'] ?? '';
  static String get emailContact => dotenv.env['EMAIL_CONTACT'] ?? '';
  // ... fais de même pour les autres
}
