import 'package:flutter_dotenv/flutter_dotenv.dart';

class ContactConfig {
  // --- EMAIL ---
  // Ce getter va chercher la clé dans ton fichier .env
  static String get emailContact =>
      dotenv.env['EMAIL_CONTACT'] ?? 'joannepierre2026@gmail.com';
}
