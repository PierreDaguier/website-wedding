class ContactConfig {
  // --- EMAIL ---
  // Lecture via --dart-define (ex: EMAIL_CONTACT)
  static String get emailContact => const String.fromEnvironment(
        'EMAIL_CONTACT',
        defaultValue: 'joannepierre2026@gmail.com',
      );
}
