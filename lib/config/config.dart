class ContactConfig {
  static const String phonePierre =
      String.fromEnvironment('PHONE_PIERRE', defaultValue: '');
  static const String phoneJoanne =
      String.fromEnvironment('PHONE_JOANNE', defaultValue: '');
  static const String phoneContact =
      String.fromEnvironment('PHONE_CONTACT', defaultValue: '');
  static const String emailContact =
      String.fromEnvironment('EMAIL_CONTACT', defaultValue: '');
  static const String emailJoanne =
      String.fromEnvironment('EMAIL_JOANNE', defaultValue: '');
  static const String emailPierre =
      String.fromEnvironment('EMAIL_PIERRE', defaultValue: '');
}
