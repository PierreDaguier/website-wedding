<<<<<<< HEAD
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ContactConfig {
  // On utilise des getters pour récupérer la valeur en temps réel dans le .env
  static String get phonePierre =>
      dotenv.env['PHONE_PIERRE'] ?? 'Numéro non disponible';
  static String get phoneJoanne => dotenv.env['PHONE_JOANNE'] ?? '';
  static String get emailContact => dotenv.env['EMAIL_CONTACT'] ?? '';
  // ... fais de même pour les autres
=======
import 'dart:convert';
import 'package:flutter/services.dart';

class ContactConfig {
  static String phonePierre =
      const String.fromEnvironment('PHONE_PIERRE', defaultValue: '');
  static String phoneJoanne =
      const String.fromEnvironment('PHONE_JOANNE', defaultValue: '');
  static String phoneContact =
      const String.fromEnvironment('PHONE_CONTACT', defaultValue: '');
  static String emailContact =
      const String.fromEnvironment('EMAIL_CONTACT', defaultValue: '');
  static String emailJoanne =
      const String.fromEnvironment('EMAIL_JOANNE', defaultValue: '');
  static String emailPierre =
      const String.fromEnvironment('EMAIL_PIERRE', defaultValue: '');

  static Future<void> load() async {
    try {
      final raw = await rootBundle.loadString('secrets.json');
      final data = jsonDecode(raw) as Map<String, dynamic>;
      phonePierre = _readValue(data, 'PHONE_PIERRE', phonePierre);
      phoneJoanne = _readValue(data, 'PHONE_JOANNE', phoneJoanne);
      phoneContact = _readValue(data, 'PHONE_CONTACT', phoneContact);
      emailContact = _readValue(data, 'EMAIL_CONTACT', emailContact);
      emailJoanne = _readValue(data, 'EMAIL_JOANNE', emailJoanne);
      emailPierre = _readValue(data, 'EMAIL_PIERRE', emailPierre);
    } catch (_) {
      // Ignore missing secrets file or parsing errors and keep defaults.
    }
  }

  static String _readValue(
    Map<String, dynamic> data,
    String key,
    String fallback,
  ) {
    final value = data[key];
    if (value == null) {
      return fallback;
    }
    final trimmed = value.toString().trim();
    return trimmed.isEmpty ? fallback : trimmed;
  }
>>>>>>> f69b603540461bbf81866f3bb372bee9420577b4
}
